%Regras e fatos (ambiente completo 3 dos slides)
%objeto(X,Y).
escada(9,1).
escada(1,2).
escada(10,3).
escada(5,4).
carrinho(3,2).
carrinho(5,2).
carrinho(7,2).
carrinho(7,3).
carrinho(7,5).
carrinho(8,4).
ladrao(1,5).
meta([X,Y]) :- ladrao(X,Y).
objeto(X,Y) :- carrinho(X,Y).
objeto(X,Y) :- escada(X,Y).
objeto(X,Y) :- ladrao(X,Y).

conectado([X,Y1],[X,Y2], Caminho) :- write('c1'), escada(X,Y1), Y2 is (Y1+1), Y2<6, not(pertence([X,Y2],[X,Y1]|Caminho)).
conectado([X1,Y],[X2,Y], Caminho) :- write('c2'), X2 is (X1+1), X2 < 11, not(carrinho(X2,Y)), write(X1), write(X2), write('c2.1'), not(pertence([X2,Y],[X1,Y]|Caminho)), write('c2.2').
conectado([X1,Y],[X2,Y], Caminho) :- write('c3'), X2 is (X1-1), X2 > 0, not(carrinho(X2,Y)), write(X1), write(X2), write('c3.1'), not(pertence([X2,Y],[X1,Y]|Caminho)), write('c3.2').
conectado([X1,Y],[X3,Y], Caminho) :- write('c4'), X2 is (X1+1), X3 is (X1+2), X3<11, carrinho(X2,Y), write('c4.1'),  not(objeto(X3,Y)), write('c4.2'), not(pertence([X2,Y],[X1,Y]|Caminho)), write('c4.3').

%conectado([X,Y1],[X,Y2]) :- write('c3'), escada(X,Y1), Y2 is (Y1+1).
%conectado([X2,Y],[X1,Y]) :- write('c4'),  X2 > X1,conectado([X1,Y],[X2,Y]), .

conectado([X1,Y],[X3,Y],Caminho) :- write('c5'),   X2 is (X1-1), X3 is (X1-2), X3>0, carrinho(X2,Y), write('c5.1'),  not(objeto(X3,Y)), write('c5.2'), not(pertence([X2,Y],[X1,Y]|Caminho)), write('c5.3').
conectado([X,Y1],[X,Y2],Caminho) :- write('c6'), escada(X,Y2), Y2 is (Y1-1), Y2>0, not(pertence([X,Y2],[X,Y1]|Caminho)).
%conectado([X,Y2],[X,Y1]) :- write('c5'), conectado([X,Y1],[X,Y2]), Y2 > Y1.

pertence(X,[X|_]).
pertence(X,[_|L]) :- pertence(X,L).

%para achar a solução:
%  ?-solucao_bp([x_inicial,y_inicial],X)
%  ?-solucao_bp([1,1],X)
solucao_bp(Inicial,Solucao) :- bp([],Inicial,Solucao).
bp(Caminho,Estado,[Estado|Caminho]) :- nl, meta(Estado), write(done).
bp(Caminho,Estado,Solucao) :- write(Estado), write('a'), conectado(Estado,Sucessor, Caminho), write(' b '), not(pertence(Sucessor,[Estado|Caminho])), write([Estado|Caminho]) , write(' c '), bp([Estado|Caminho],Sucessor,Solucao).

