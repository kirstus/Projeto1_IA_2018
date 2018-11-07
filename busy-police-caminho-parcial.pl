%execute com: 
%	$ swipl -f busy-police.pl ambiente.pl

%meta do problema de busca
meta([X,Y]) :- ladrao(X,Y).

%objetos que se bloqueiam a passagem pelo carrinho:
objeto(X,Y) :- carrinho(X,Y).
objeto(X,Y) :- escada(X,Y).
objeto(X,Y) :- ladrao(X,Y).

%movimentos permitidos
%prioridade: subir andares e mover-se para a direita
%	Elevador
conectado([X,Y1],[X,Y2], Caminho) :-  elevador(X,LY),  pertence(Y1,LY), pertence(Y2,LY), not(Y2=Y1), not(objeto(X,Y2)) , Y2 > 0, Y2<6, not(pertence([X,Y2],[X,Y1]|Caminho)), write(' Regra Elevador. ').
%	Subir escada
conectado([X,Y1],[X,Y2], Caminho) :- escada(X,Y1), Y2 is (Y1+1), Y2<6, not(pertence([X,Y2],[[X,Y1]|Caminho])), write(' Regra Subir escada. ').
%	Andar para a direita
conectado([X1,Y],[X2,Y], Caminho) :- X2 is (X1+1), X2 < 11, not(carrinho(X2,Y)), not(pertence([X2,Y],[[X1,Y]|Caminho])), write(' Regra Andar Direita. ').
%	andar para a esquerda
conectado([X1,Y],[X2,Y], Caminho) :- X2 is (X1-1), X2 > 0, not(carrinho(X2,Y)),not(pertence([X2,Y],[[X1,Y]|Caminho])), write(' Regra Andar Esquerda. ').
%	pular o carrinho para a direita
conectado([X1,Y],[X3,Y], Caminho) :- X2 is (X1+1), X3 is (X1+2), X3<11, carrinho(X2,Y),  not(objeto(X3,Y)),not(pertence([X2,Y],[[X1,Y]|Caminho])), write(' Regra Pular carrinho Direita. ').
%	pular o carrinho para a esquerda
conectado([X1,Y],[X3,Y],Caminho) :-  X2 is (X1-1), X3 is (X1-2), X3>0, carrinho(X2,Y), not(objeto(X3,Y)), not(pertence([X2,Y],[[X1,Y]|Caminho])), write(' Regra Pular Carrinho Esquerda. ').
% regra 6: não é necessária nos exemplos dos slides, porém em certos casos pode ser necessário subir um andar e descer por outra escada
% 	descer escada
conectado([X,Y1],[X,Y2],Caminho) :- escada(X,Y2), Y2 is (Y1-1), Y2>0, not(pertence([X,Y2],[[X,Y1]|Caminho])), write(' Regra Descer escada. ').



%  Regras de manipulação de listas
pertence(X,[X|_]).
pertence(X,[_|L]) :- pertence(X,L).
add_ultimo(Elem,[ ],[Elem]).
add_ultimo(Elem, [Cabeça|Cauda],[Cabeça|Cauda_Resultante]) :- add_ultimo(Elem,Cauda,Cauda_Resultante).

% Algoritmo de busca em profundidade:
%para achar a solução:
%  ?-solucao_bp([x_inicial,y_inicial],X)
%  ?-solucao_bp([1,1],X)
solucao_bp(Solucao) :- inicio(X,Y), bp([],[X,Y],Solucao).
bp(Caminho,Estado,Solucao) :- add_ultimo(Estado,Caminho,Solucao), nl, meta(Estado), write(done).
bp(Caminho,Estado,Solucao) :- write("Estado Atual: "), write(Estado),  conectado(Estado,Sucessor, Caminho), not(pertence(Sucessor,[Estado|Caminho])), add_ultimo(Estado,Caminho,Caminho2), nl, write("Caminho Parcial: "), write(Caminho2) , bp(Caminho2,Sucessor,Solucao).

