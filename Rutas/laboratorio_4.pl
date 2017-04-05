:- dynamic(father/2).
:- dynamic(likes/2).
:- dynamic(friend/2).
:- dynamic(stabs/3).
:- dynamic(edge/4).


%edge(+start,+end,+weight,+time)%
edge(a,b,4,8).
edge(a,c,5,7).

edge(b,a,4,8).
edge(b,d,6,9).

edge(c,a,5,7).
edge(c,d,3,9).

edge(d,c,3,9).
edge(d,b,6,9).


/*
 * afuera distancia
 * adentro tiempo
 *
 *		4km
 *     A------------------B
 *     |	8H	  |
 *     |		  |
 * 5km | 7H	       9H | 6km
 *     |                  |
 *     |	9H	  |
 *     C------------------C
 *              3km
 *
 *
 *               _
 *              |_|
 */




father(lord_montague,romeo).
father(lord_capulet,juliet).


likes(mercutio,dancing).
likes(benvolio,dancing).
likes(romeo,dancing).
likes(romeo,juliet).
likes(juliet,romeo).
likes(juliet,dancing).

friend(romeo,mercutio).
friend(romeo,benvolio).


stabs(tybalt,mercutio,sword).
stabs(romeo,tybalt,sword).
