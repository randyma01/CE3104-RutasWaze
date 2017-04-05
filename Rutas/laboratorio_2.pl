%___________________________________________________________________________

:-dynamic
	rpath/2.      % A reversed path
edge(a,c,4,3).
edge(a,b,6,5).
edge(b,a,6).
edge(b,d,2).
edge(c,a,4).
edge(c,f,5).
edge(d,b,2).
edge(d,e,3).
edge(d,f,3).
edge(e,d,3).
edge(e,g,8).
edge(f,c,5).
edge(f,d,2).
edge(f,g,7).
edge(g,e,8).
edge(g,f,7).


path(From,To,Dist) :- edge(To,From,Dist).
path(From,To,Dist) :- edge(From,To,Dist).

shorterPath([H|Path], Dist) :-		       % path < stored path? replace it
	rpath([H|T], D), !, Dist < D,          % match target node [H|_]
	retract(rpath([H|_],_)),
	writef('%w is closer than %w\n', [[H|Path], [H|T]]),
	assert(rpath([H|Path], Dist)).
shorterPath(Path, Dist) :-		       % Otherwise store a new path
	writef('New path:%w\n', [Path]),
	assert(rpath(Path,Dist)).

traverse(From, Path, Dist) :-		    % traverse all reachable nodes
	path(From, T, D),		    % For each neighbor
	not(memberchk(T, Path)),	    %	which is unvisited
	shorterPath([T,From|Path], Dist+D), %	Update shortest path and distance
	traverse(T,[From|Path],Dist+D).	    %	Then traverse the neighbor

traverse(From) :-
	retractall(rpath(_,_)),           % Remove solutions
	traverse(From,[],0).              % Traverse from origin
traverse(_).

go(From, To) :-
	traverse(From),                   % Find all distances
	rpath([To|RPath], Dist)->         % If the target was reached
	  reverse([To|RPath], Path),      % Report the path and distance
	  Distance is round(Dist),
	  writef('Shortest path is %w with distance %w = %w\n',
	       [Path, Dist, Distance]);
	writef('There is no route from %w to %w\n', [From, To]).
