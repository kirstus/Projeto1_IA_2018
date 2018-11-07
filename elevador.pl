%Regras e fatos (ambiente completo 3 dos slides)
	
%inicio(X,Y)
inicio(1,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(10,1).
escada(1,2).
escada(10,3).
escada(5,4).

%carrinho(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
carrinho(3,2).
carrinho(6,2).
carrinho(7,3).
carrinho(7,5).
carrinho(8,4).
%bloqueia as portas do elevador:
carrinho(4,3).
%carrinho(4,4).

% ALGO A MAIS
%X onde o elevador esta, lista de Y onde ele para.
elevador(4,[1,3,4]).

%ladrao(X,Y).
ladrao(1,5).

