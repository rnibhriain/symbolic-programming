%% ------- Question 1 --------


nbd -->  [h(Col1,Nat1,Pet1), h(Col2,Nat2,Pet2), h(Col3,Nat3,Pet3)],
			{lex(Col1, col), lex(Col2, col), Col1\=Col2, lex(Col3, col), Col2\=Col3, Col1\=Col3,
			lex(Nat1, nat), lex(Nat2, nat), Nat1\=Nat2, lex(Nat3, nat), Nat2\=Nat3, Nat1\=Nat3,
			lex(Pet1, pet), lex(Pet2, pet), Pet1\=Pet2, lex(Pet3, pet), Pet2\=Pet3, Pet1\=Pet3}.

lex(red, col).
lex(blue, col). 
lex(green, col).

lex(english, nat).
lex(japanese, nat).
lex(spanish, nat).

lex(snail, pet).
lex(jaguar, pet).
lex(zebra, pet).

%% ------- Question 2 --------
fib --> [0,1], fibn(0,1).
fibn(_,_) --> [].
fibn(F2,F1) --> [F], {F is F2+F1}, fibn(F1,F).



%% ------- Question 3 --------

accept(N,String) :- steps(N,q0,String,Q), final(N,Q).
steps(_,Q,[],Q).
steps(N,Q1,[H|T],Q2) :- tran(N,Q1,H,Q), steps(N,Q,T,Q2).


%%	(a)
%%(i)
tran(N,Q1,H,Q) :- N1 is N-1, tran(Q1,H,Q).
tran(q0,1,q1).
tran(q0,0,q0).
tran(q0,1,q0).

tran(q1,0,q2).
tran(q1,1,q2).

tran(q2,0,q3).
tran(q2,1,q3).

%%(ii)
final(N,q3).


q0 --> [0],q0.
q0 --> [1],q0.
q0 --> [1],q1.

q1 --> [0],q2.
q1 --> [1],q2.

q2 --> [0],q3.
q2 --> [1],q3.

q3 --> [].

%%	(b)


%%	(c)