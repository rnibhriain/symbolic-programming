numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

%% not sure they are all split up correctly as i had all the clauses together originally

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

%% Excercise 1
add(s(X),Y,s(Z)) :- simplify(X,SX), simplify(Y,SY), add(SX,SY,AZ), simplify(AZ,Z).
add(A+B,C,Z) :- simplify(A+B,SAB),simplify(C,SC),add(SAB,SC,AZ), simplify(AZ,Z).
add(0,X,Y) :- simplify(X,Y).
simplify(0,0).
simplify(X+Y,Z) :- simplify(X,SX),simplify(Y,SY),add(SX,SY,AZ),simplify(AZ,Z).
add2(X,Y,Z) :- simplify(X,SX),simplify(Y,SY),add(SX,SY,AZ), simplify(AZ,Z).

%% Excercise 2
simplify(s(X),Y) :- simplify(X,p(Y)).
simplify(p(X),Y) :- simplify(X,s(Y)).
simplify(s(X),s(Y)) :- simplify(X,Y),(simplify(Y,s(_)) ; simplify(Y,0)).
simplify(p(X),p(Y)) :- simplify(X,Y),(simplify(Y,p(_)) ; simplify(Y,0)).
add(p(X),Y,p(Z)) :- simplify(X,SX), simplify(Y,SY), add(SX,SY,AZ), simplify(AZ,Z).


%% Excercise 3
minus(s(X),Y) :- minus(X,s(Y)).
minus(p(X),Y) :- minus(X,p(Y)).
minus(s(A),p(B)):- minus(A,B),(minus(B,s(_)) ; minus(B,0)).
minus(p(A),s(B)):- minus(A,B),(minus(B,p(_)) ; minus(B,0)).
minus(0,0).

%%Excercise 5
subtract(0,X,Z) :- minus(X,Z).
subtract(X,Y,Z) :- minus(Y,A), add2(X,A,Z).
subtract(X,-Y,Z) :- add2(X,Y,Z).

%%Excercise 4
simplify(-A,Z) :- simplify(A,SA), minus(SA,Z).  


%% Excercise 6
subtract(X,Y,Z) :- simplify(X,SX),simplify(Y,SY),minus(SY,MY),add(SX,MY,AZ), simplify(AZ,Z).
simplify(A-B,Z) :- subtract(A,B,Z). 