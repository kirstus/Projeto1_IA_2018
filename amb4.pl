%Regras e fatos (ambiente completo 2 dos slides)

%inicio(X,Y)
inicio(3,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(9,1).
escada(2,2).
escada(4,3).
escada(10,3).
escada(6,4).

%carrinho(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
carrinho(7,1).
carrinho(7,2).
carrinho(7,3).
carrinho(7,4).
carrinho(7,5).

% ALGO A MAIS
%X onde o elevador esta, lista de Y onde ele para.
elevador(44,[1,3,4]).

%ladrao(X,Y).
ladrao(10,5).

