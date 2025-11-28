%                           family tree
parent(pam ,bob).
parent(tom ,bob).
parent(tom ,liz).
parent(bob ,ann).
parent(bob ,pat).
parent(pat ,jim).

male(tom).
male(bob).
male(jim).

female(pam).
female(liz).
female(ann).
female(pat).

mother(X,Y):-parent(X,Y),female(X). 
father(X,Y):-parent(X,Y),male(X). 

grandparent(X,Y):-parent(X,Z),parent(Z,Y). 
grandfather(X,Y):-grandparent(X,Y),male(X). 
grandmother(X,Y):-grandparent(X,Y),female(X). 

sibling(X,Y):-parent(Z,X),parent(Z,Y),X\=Y. 
brother(X,Y):-sibling(X,Y),male(X). 
sister(X,Y):-sibling(X,Y),female(X). 

uncle(X,Y):-sibling(Z,X),parent(Z,Y),male(X). 
aunt(X,Y):-sibling(Z,X),parent(Z,Y),female(X).
 
ancestor(X,Y):-parent(X,Y). 
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y). 
 
descendent(X,Y):-parent(Y,X). 
descendent(X,Y):-parent(Z,X),descendent(Z,Y).

%                         sum of two numbers in 3 ways

sum:-write("Enter first number: "),read(X),write("Enter second number: "),read(Y),Z is X+ Y,write(Z).
sum(X,Y,Z):-Z is X+Y.
sum(X,Y):-Z is X+Y,write(Z).


%                        maxmium

max1(X,Y,M):-X>Y,M is X.
max1(X,Y,M):-X<Y,M is Y.
max2(X,Y,M):-(X>Y)->M is X;M is Y.


%                         factorial

fact(0,1).
fact(N,F):-N>0,N1 is N-1,fact(N1,F1),F is N*F1.


%                         fibonnaci

fib(0,0).
fib(1,1).
fib(N,R):-N>1,N1 is N-1,N2 is N-2,fib(N1,R1),fib(N2,R2),R is R1+R2.


%                          power of number

power(Num,0,1).
power(Num,Pow,Ans):-Pow>0,Pow1 is Pow-1,power(Num,Pow1,Ans),.


%                      multiple of two numbers

multi(N1,0,0).
multi(N1,N2,R):-N2>0, B is N2-1,multi(N1,B,R1),R is N1+R1.


%                       greatest common divisor

gcd(X,0,X).
gcd(X,Y,Z):-Y>0,A is X mod Y,gcd(Y,A,Z).


%                            revrse list

reverse1([],[]). 
reverse1([Head|Tail],R):-reverse1(Tail,R1),conc(R1,[Head],R).


%                                sum of element in list

sumlist([],0). 
sumlist([Head|Tail],S):-sumlist(Tail,S1),S is Head+S1.


%                                evenlength(list) & oddlength(list)

evenlength([]):-!. 
oddlength([X]):-!. 
evenlength([H|T]):-oddlength(T). 
oddlength([H|T]):-evenlength(T).


%                                  max element in list

maxlist([X],X):-!. 
maxlist([Head|Tail],M):-maxlist(Tail,M1),(Head>M1->M=Head;M=M1).


%                           insert element in nth pos

insert(I,1,L,[I|L]):-!. 
insert(I,N,[Head|Tail],[Head|Tail1]):- 
N>1, 
N1 is N-1, 
insert(I,N1,Tail,Tail1).


%                           delete from nth pos

delete(1,[_|Tail],Tail):-!. 
delete(N,[Head|Tail],[Head|Tail1]):- 
N>1, 
N1 is N-1, 
delete(N1,Tail,Tail1).


%                               check palindrome

palin(L):- 
reverse(L,R), 
(R==L)->write("List is palindrome.");write("List is not 
palindrome.").


%                              length of list

len([],0):-!. 
len([H|T],X):-len(T,X1),X is X1+1.


%                              member of list

memb(X,[X|Tail]):-!. 
memb(X,[Head|Tail]):-memb(X,Tail).


%                         concatination of 2 list

conc([],L,L). 
conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).




