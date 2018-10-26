%Regras e fatos (ambiente completo 1 dos slides)
	
%inicio(X,Y)
inicio(10,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(2,1).
escada(1,4).
escada(3,3).
escada(5,2).
escada(6,4).
escada(8,3).
escada(9,1).
escada(10,3).

%carrinho(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
carrinho(8,1).
carrinho(3,2).
carrinho(3,5).
carrinho(4,5).
carrinho(4,3).

% ALGO A MAIS
%X onde o elevador esta, lista de Y onde ele para.
elevador(41,[1,3,4]).

%ladrao(X,Y).
ladrao(10,5).

