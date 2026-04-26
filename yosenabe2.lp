horizontal_path(X,Y,XX) :- 
    number(X,Y,_), area(XX,Y,_), XX != X,
    #count{ Xn : cell(Xn,Y), Xn > X, Xn < XX } = XX - X - 1, XX > X.

horizontal_path(X,Y,XX) :- 
    number(X,Y,_), area(XX,Y,_), XX != X,
    #count{ Xn : cell(Xn,Y), Xn > XX, Xn < X } = X - XX - 1, XX < X.

vertical_path(X,Y,YY) :- 
    number(X,Y,_), area(X,YY,_), YY != Y,
    #count{ Yn : cell(X,Yn), Yn > Y, Yn < YY } = YY - Y - 1, YY > Y.

vertical_path(X,Y,YY) :- 
    number(X,Y,_), area(X,YY,_), YY != Y,
    #count{ Yn : cell(X,Yn), Yn > YY, Yn < Y } = Y - YY - 1, YY < Y.

possible_target(X,Y,XX,Y) :- horizontal_path(X,Y,XX).
possible_target(X,Y,X,YY) :- vertical_path(X,Y,YY).

1 { target(X,Y,XX,YY) : possible_target(X,Y,XX,YY) } 1 :- number(X,Y,_).

% Question 2
:- area(_,_,A), not target(_,_,XX,YY) : area(XX,YY,A).

#show target/4.