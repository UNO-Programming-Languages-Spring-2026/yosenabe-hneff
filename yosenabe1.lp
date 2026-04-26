horizontal_path(X,Y,XX) :- 
    number(X,Y,_), area(XX,Y,_), XX != X,
    #count{ Xm : cell(Xm,Y), Xm > X, Xm < XX } = XX - X - 1, XX > X.

horizontal_path(X,Y,XX) :- 
    number(X,Y,_), area(XX,Y,_), XX != X,
    #count{ Xm : cell(Xm,Y), Xm > XX, Xm < X } = X - XX - 1, XX < X.

vertical_path(X,Y,YY) :- 
    number(X,Y,_), area(X,YY,_), YY != Y,
    #count{ Ym : cell(X,Ym), Ym > Y, Ym < YY } = YY - Y - 1, YY > Y.

vertical_path(X,Y,YY) :- 
    number(X,Y,_), area(X,YY,_), YY != Y,
    #count{ Ym : cell(X,Ym), Ym > YY, Ym < Y } = Y - YY - 1, YY < Y.

possible_target(X,Y,XX,Y) :- horizontal_path(X,Y,XX).
possible_target(X,Y,X,YY) :- vertical_path(X,Y,YY).

1 { target(X,Y,XX,YY) : possible_target(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.