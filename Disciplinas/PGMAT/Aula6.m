%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programa para plotar o grafico de um conjunto fuzzy via funcao de pertinencia
% ------------------------------------------------------------------------------
%        Universidade Estadual Paulista "Julio de Mesquita Filho" 
% ------------------------------------------------------------------------------
% Disciplina: Sistemas pfuzzy, pos-graduacao, turma 2022
% Prof. Dr. Vinícius F. Wasques
%-------------------------------------------------------------------------------

clc % limpa a janela de comandos
clear all % limpa a memoria
close all % fecha as figuras que estao abertas

a = 1; % entrada do numero fuzzy triangular (a,u,b)
u = 2; % entrada do numero fuzzy triangular (a,u,b)
b = 3; % entrada do numero fuzzy triangular (a,u,b)

pertesq = @(x) (x-a)/(u-a); % calcula o lado esquerdo da funcao pertinencia
pertdir = @(x) (x-b)/(u-b); % calcula o lado direito da funcao pertinencia

U = linspace(0,4,101); % linspace(a,b,n) eh um comando 
% que particiona o intervalo [a,b] em n pontos

pertinencia = zeros(length(U),1); % o comando zeros(m,n) cria uma matriz
% cujos elementos sao todos iguais a zero, m representa o numero de linhas e
% n representa o numero de colunas
% o comando length(X) determina o tamanho do 'vetor' X

for i = 1:length(U)
  if (U(i)>=1 && U(i)<2)
    pertinencia(i,1) = pertesq(U(i));
  elseif (U(i)>=2 && U(i)<3)
    pertinencia(i,1) = pertdir(U(i));
  else 
    pertinencia(i,1) = 0;
  endif
endfor
    
figure
plot(U,pertinencia) 