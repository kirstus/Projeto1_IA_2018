%Regras e fatos (ambiente completo 2 dos slides)

%inicio(X,Y)
inicio(1,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(2,1).	
escada(5,1).
escada(8,1).
escada(10,1).
escada(10,2).
escada(1,3).
escada(1,4).
escada(6,4).
escada(9,4).

%carrinho(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
carrinho(3,1).
carrinho(4,1).
carrinho(9,1).
carrinho(3,2).
carrinho(6,2).
carrinho(7,2).
carrinho(4,3).
carrinho(7,3).
carrinho(3,4).
carrinho(4,4).
carrinho(4,5).
carrinho(7,5).
carrinho(8,5).

% ALGO A MAIS
%X onde o elevador esta, lista de Y onde ele para.
elevador(41,[1,3,4]).

%ladrao(X,Y).
ladrao(10,5).

