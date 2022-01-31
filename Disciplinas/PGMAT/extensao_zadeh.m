%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programa para plotar o grafico de um conjunto fuzzy via funcao de pertinencia
% ------------------------------------------------------------------------------
%        Universidade Estadual Paulista "Julio de Mesquita Filho" 
% ------------------------------------------------------------------------------
% Disciplina: Sistemas pfuzzy, pos-graduacao, turma 2022
% Prof. Dr. Vini�cius F. Wasques
%-------------------------------------------------------------------------------

clc
close all
clear all

% Particao de alfa em [0,1]
alfa = linspace(0,1,101);

% Ponta esquerda do alfa-nivel do número fuzzy
A(:,1) = -1+alfa; 
% Ponta direita do alfa-nivel do número fuzzy
A(:,2) = 1-alfa; 

% Funcao a ser estendida
%f = @(x) 2*x+1;
f = @(x) x.^2;

%Extensao da funcao f em A, ou seja, f(A)
for i = 1:length(alfa)
Dom = linspace(A(i,1),A(i,2),101);

% Avaliacao do inf e sup de f(A)
FA(i,1) = min(f(Dom)); %extremo inferior
FA(i,2) = max(f(Dom)); %extremo superior
end 

% Imagem do numero fuzzy
%figure
subplot(1,2,1)
hold on
for i=1:length(alfa)
plot(A(i,1),alfa(i),'color',[1-alfa(i), 1-alfa(i), 1-alfa(i)]); % vetores de coloracao para produzir os tons de cinza
plot(A(i,2),alfa(i),'color',[1-alfa(i), 1-alfa(i), 1-alfa(i)]); % vetores de coloracao para produzir os tons de cinza
end 
xlabel('Dominio de A')
ylabel('Grau de pertinencia')
hold off

% Imagem da extensao do numero fuzzy atraves da funcao f
%figure
subplot(1,2,2)
hold on
for i=1:length(alfa)
plot(FA(i,1),alfa(i),'color',[1-alfa(i), 1-alfa(i), 1-alfa(i)]); % vetores de coloracao para produzir os tons de cinza
plot(FA(i,2),alfa(i),'color',[1-alfa(i), 1-alfa(i), 1-alfa(i)]); % vetores de coloracao para produzir os tons de cinza
end 
xlabel('Dominio de f(A)')
ylabel('Grau de pertinencia')
hold off

