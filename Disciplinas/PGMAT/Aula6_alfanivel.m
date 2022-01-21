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

alfa = linspace(0,1,101); % particiona o alfa-nivel

alfaesq = a+alfa*(u-a); % calcula o extremo esquerdo do alfa-nivel
alfadir = b+alfa*(u-b); % calcula o extremo direito do alfa-nivel

figure
plot(alfaesq,alfa,'b',alfadir,alfa,'b') % o comando 'b' especifica a cor do grafico. No caso 'b' significa cor azul (do ingles, blue)