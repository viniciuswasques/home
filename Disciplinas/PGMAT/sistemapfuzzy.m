%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Programa para modelo p-fuzzy 
% ------------------------------------------------------------------------------
%        Universidade Estadual Paulista "Julio de Mesquita Filho" 
% ------------------------------------------------------------------------------
% Disciplina: Sistemas pfuzzy, pos-graduacao, turma 2022
% Prof. Dr. Vinícius F. Wasques
%-------------------------------------------------------------------------------
clear all
clc
close all

%-------------------------------
% Parametros gerais do sistema
%-------------------------------

% Discretizacao do tempo. t = linspace(tempo inicial,tempo final,quantidade de pontos)
t = linspace(0,10,101);
% Tamanho do passo, que aqui está associado com a discretização acima
h = t(2)-t(1);
% Condicao inicial do PVI. Caso seu exemplo tenha mais de uma equacao
% diferencial, acrescente a quantidade de condicao inicial necessaria
x0 = 2;

% Insira aqui os parametros do modelo necessarios, por exemplo, taxa de
% reacao quimica, taxa de crescimento populacional, taxa de predacao, etc
k = 0.1;

% Armazenamento dos valores da solucao pfuzzy. Caso seu problema tenha mais
% de uma solucao, insira a quantidade de matrizes de armazenamento
% necessaria. Por exemplo, um modelo empidemiologico do tipo SI
% (suscetivel-infectado) precisa de duas matrizes, uma para S e outra para
% I
X = zeros(length(t),1);

% Atribuicao da condicao inicial na primeira entrada da matriz solucao
X(1,1) = x0;

% Leitura do SBRF que voces vao produzir. Entre as aspas ' ' voces vao
% colocar o nome do arquivo que vao salvar no toolbox fuzzy, que estara no
% formato .fis
SBRFx = readfis('nomearquivo');

% Inicio da simulacao utilizando o metodo de Euler 
% x_{k+1} = x_{k} + h(SBRF(x_{k})
for i=1:(length(t)-1)
    x=X(i,1);
    saidaSBRFx(i)=evalfis([x'],SBRFx);
    X(i+1,1)=X(i,1)+h*saidaSBRFx(i); 
end

% Comando para plotar a solucao do problema. Caso existam mais solucoes,
% inserir a quantidade de figure necessaria, seguindo os passos do comando
% abaixo
figure
plot(t,X,'b.');
legend('Solucao do problema via sistemas p-fuzzy')
grid on
