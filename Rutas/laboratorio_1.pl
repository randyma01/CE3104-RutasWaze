/*
p(a, c). % 4
p(a, b). % 6

p(b, a). % 6
p(b, d). % 2

p(c, a). % 4
p(c, f). % 5

p(d, b). % 2
p(d, e). % 3
p(d, f). % 2

p(e, d). % 3
p(e, g). % 8

p(f, c). % 5
p(f, d). % 2
p(f, g). % 7

p(g, e). % 8
p(g, f). % 7


e(g(Es,Vs),V1,V2,Value):-
    member(e(V1,V2,Value),Vs).

g([a, b, c, d, e, g, f],
      [e(a,c,4),
       e(a,b,6),
       e(b,a,6),
       e(b,d,2),
       e(c,a,4),
       e(c,f,5),
       e(d,b,2),
       e(d,e,3),
       e(d,f,3),
       e(e,d,3),
       e(e,g,8),
       e(f,c,5),
       e(f,d,2),
       e(f,g,7),
       e(g,e,8),
       e(g,f,7)]).
*/

camino(Inicio,Fin,grafo(Ve,A),V,[Inicio|C]):-
    member(e(Inicio,TMP),A),
    \+member(e(Inicio,TMP),V),
    camino(TMP,Fin,grafo(Ve,A),[e(Inicio,TMP)|V],C).

camino(Inicio,Inicio,_,_,[Inicio]).


g(grafo([a, b, c, d, e, g, f],
  [e(a,c),
   e(a,b),
   e(b,a),
   e(b,d),
   e(c,a),
   e(c,f),
   e(d,b),
   e(d,e),
   e(d,f),
   e(e,d),
   e(e,g),
   e(f,c),
   e(f,d),
   e(f,g),
   e(g,e),
   e(g,f)])).

% coloring1(+Graph,+Colors,-Coloring)
coloring1(g(Vs,Es),Colors,Coloring):-
   gener(Vs,Colors,Coloring),
   test(Es,Coloring).

% gener(+Vertices,+Colors,-Coloring)
gener([],_,[]).
gener([V|Vs],Colors,[V-C|T]):-
   member(C,Colors), % non-deterministic generator of colors
   gener(Vs,Colors,T).

% test(+Edges,+Coloring)
test([],_).
test([e(V1,V2)|Es],Coloring):-
   member(V1-C1,Coloring), % find color of vertex V1
   member(V2-C2,Coloring), % find color of vertex V2
   C1\=C2,                 % test the difference of colors
   test(Es,Coloring).

% coloring2(+Graph,+Colors,-Coloring)
coloring2(g(Vs,Es),Colors,Coloring):-
   gat(Vs,Es,Colors,[],Coloring).   % generate and test

% gat(Vertices,Edges,Colors,ColoredVertices,FinalColoring)
gat([],_,_,Coloring,Coloring).
gat([V|Vs],Es,Cs,Acc,Coloring):-
   member(C,Cs),          % generate color for vertex V
   test2(Es,V,C,Acc),     % test the validity of current coloring
   gat(Vs,Es,Cs,[V-C|Acc],Coloring).

% test2(+Edges,+Vertex,+Color,+CurrentColoring)
test2([],_,_,_).
test2([e(V1,V2)|Es],V,C,CColoring):-
   (V=V1 -> (member(V2-C2,CColoring) -> C\=C2 ; true)
    ;(V=V2 -> (member(V1-C1,CColoring) -> C\=C1 ; true)
     ;true)),
   test2(Es,V,C,CColoring).


% coloring3(+Graph,+Colors,-Coloring)
coloring3(g(Vs,Es),Colors,Coloring):-
   prep(Vs,Colors,ColoredVs),
   gtb(ColoredVs,Es,[],Coloring).

% prep(+Vertices,+Colors,+SuperColoring)
prep([],_,[]).
prep([V|Vs],Colors,[V-Colors|CVs]):-
   prep(Vs,Colors,CVs).

% gtb(+SuperColoring,+Edges,+PartialColoring,-Coloring)
gtb([],_,Coloring,Coloring).
gtb([V-Cs|Vs],Es,Acc,Coloring):-
   member(C,Cs),                  % select only one color
   fc(Es,V,C,Vs,ConstrainedVs),   % forward checking
   gtb(ConstrainedVs,Es,[V-C|Acc],Coloring).

% fc(+Edges,+Vertex,+VertexColor,+InputSuperColoring,-OutputSuperColoring)
fc([],_,_,Vs,Vs).
fc([e(V1,V2)|Es],V,C,Vs,ConstrVs):-
   (V=V1 -> constr(Vs,V2,C,NewVs)
    ;(V=V2 -> constr(Vs,V1,C,NewVs)
      ;NewVs=Vs)),
   fc(Es,V,C,NewVs,ConstrVs).

% constr(+InputSuperColoring,+Vertex,-VertexForbiddenColor,+OutputSuperColoring)
constr([V-Cs|Vs],V,C,[V-NewCs|Vs]):-
   delete(Cs,C,NewCs),NewCs\=[].
constr([V1-Cs|Vs],V,C,[V1-Cs|NewVs]):-
   V\=V1,
   constr(Vs,V,C,NewVs).
constr([],_,_,[]).

delete([],_,[]).
delete([X|T],X,T).
delete([Y|T],X,[Y|NewT]):-
   X\=Y,
   delete(T,X,NewT).

% path(+Graph,+Start,+Stop,-Path)
path(Graph,Start,Stop,Path):-
   path1(Graph,Start,Stop,[Start],Path).

%path1(Graph,Stop,Stop,Path,Path).
path1(Graph,Start,Stop,CurrPath,Path):-
   Start\=Stop,
   edge(Graph,Start,Next),
   non_member(Next,CurrPath),
   path1(Graph,Next,Stop,[Next|CurrPath],Path).

non_member(_,[]).
non_member(X,[Y|T]):-
   X\=Y,
   non_member(X,T).

edge(Graph,V1,V2,Value):-
   member(V1-NB,Graph),
   member(V2-Value,NB).


neighbourhood(Graph,V,NB):-
   setof(V1-E,edge(Graph,V,V1,E),NB).

%min_dist(+Graph,+Start,-MinDist)
min_dist(Graph,Start,MinDist):-
   dijkstra(Graph,[],[Start-0],MinDist).

% dijkstra(+Graph,+ClosedVertices,+OpenVertices,-Distances)
dijkstra(_,MinDist,[],MinDist).
dijkstra(Graph,Closed,Open,MinDist):-
   choose_v(Open,V-D,RestOpen),
   neighbourhood(Graph,V,NB),  % NB is a list of adjacent vertices+distance to V
   diff(NB,Closed,NewNB),
   merge(NewNB,RestOpen,D,NewOpen),
   dijkstra(Graph,[V-D|Closed],NewOpen,MinDist).

% choose_v(+OpenVertices,-VertexToExpand,-RestOpenVertices)
choose_v([H|T],MinV,Rest):-
   choose_minv(T,H,MinV,Rest).
choose_minv([],MinV,MinV,[]).
choose_minv([H|T],M,MinV,[H2|Rest]):-
   H=V1-D1, M=V-D,
   (D1<D -> NextM=H,H2=M
          ; NextM=M,H2=H),
   choose_minv(T,NextM,MinV,Rest).

% diff(+ListOfVertices,+Closed,-ListOfNonClosedVertices)
diff([],_,[]).
diff([H|T],Closed,L):-
   H=V-D,
   (member(V-_,Closed) -> L=NewT ; L=[H|NewT]),
   diff(T,Closed,NewT).

% merge(+ListOfVertices,+OldOpenVertices,-AllOpenVertices)
merge([],L,_,L).
merge([V1-D1|T],Open,D,NewOpen):-
   (remove(Open,V1-D2,RestOpen)
      -> VD is min(D2,D+D1)
       ; RestOpen=Open,VD is D+D1),
   NewOpen=[V1-VD|SubOpen],
   merge(T,RestOpen,D,SubOpen).

remove([H|T],H,T).
remove([H|T],X,[H|NT]):-
   H\=X,
   remove(T,X,NT).
