# -*- coding: utf�8 -�*-
#==============================================================================
## Laborat�rio de �lgebra Linear Num�rica
#�
# pipeline2.py
# autor: prof. Moacyr "Moa" Mello (baseado em Coursera - Andrew Ng)
# email: moacyrcmello@gmail.com
#
#==============================================================================
% 
%
% Pipeline da aula2
% -----------------
%
% Contem tr�s partes que auxiliam a rodar o gradiente descendente para obter os
% modelos de classifica��o de cidades candidatas.
%    1a parte: modelo de hip�tese fronteira linear simples
%    2a parte: modelo de hip�tese fronteira linear simples com otimizador fminunc
%    3a parte: modelo de hip�tese fronteira complexa
%
% Fun��es Auxiliares
% ------------------
% 1a parte                   2a parte                  3a parte
% amostra.m                  amostra.m                 amostra.m
% plotData.m                 plotData.m                plotData.m
% costFunction.m             costFunction.m            mapFeature.m
%   -> sigmoid.m               -> sigmoid.m            costFunctionReg.m -> sigmoid.m
% gradientDescentReg.m       optimset()                optimset ()
%   -> costFunctionReg.m     fminunc ()                fminunc  ()
% plotDecisionBoundary.m     plotDecisionBoundary.m    plotDecisionBoundary.m
%          -> plotData.m              -> plotData.m             -> plotData.m
% predict.m                  predict.m                 predict.m
%
% Dados
% -----
% data1.octave X(97x1) y(97x1) univariavel: popula��o x lucro
% data2.octave X(47x2) y(47x1) multivari�vel: (�rea,salas) x custo
%


#====================================================================
# PARTE 1     modelo de hip�tese fronteira linear simples
#====================================================================


% Initializa��o
clear ; close all; clc
load data1.octave
[m, n] = size(X);

% Exame dos Dados
fprintf('Aula 2 - LOGistic Regression  v1.0.\n');
fprintf('***********************************\n');
fprintf('1a PARTE. Fronteira linear.\n\n');
%% <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ESCREVER
amostra(X, 'Matriz X: ');
amostra(y, 'Matriz y: ');

% Plot Data - figura 1
% --------------------
fprintf(' => Visualizacao dos dados: x1 x2 y ...\n\n');
plotData(X, y); # <<<<<<<<<<<<<<<<<<<<<< TEMPLATE
hold on;
title('Classificacao testes binarios em data1');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
hold off;

% ***********************************************************
% Gradient Descent - PARAMETROS
% ***********************************************************
lambda    = 1;       % lambda     1  (nao usado na 1a parte)
alpha     = 0.001;   % alpha      0.001 (0.003 limite ruin)
num_iters = 2600000; % num_iters  2 950 000

% Acrescentando o intercept em x
X = [ones(m, 1) X];
initial_theta = zeros(size(X, 2), 1);

% Compute initial cost and gradient SEM regula��o
[cost, grad] = costFunction(initial_theta, X, y);
fprintf('\nCusto inicial (J): %f  sem regulacao.', cost);

% Initialize theta and Run Gradient Descent SEM regula��o
% Observe o valor zero da regula��o, que ser� vista mais tarde.
theta = zeros(size(X, 2), 1);
[theta, J1_history] = gradientDescentReg(X, y, theta, alpha, num_iters, 0); # <<<< ESCREVER
fprintf('\ntheta(0): %f   theta(1): %f   theta(2): %f ', theta(1), theta(2), theta(3));

% Plot Data - figura 2
% --------------------
fprintf('\nPlotting grafico de convergencia sem regulacao...\n');
figure ("position", [5, 315, 560, 420]);
plot(1:numel(J1_history), J1_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
title('Convergencia do gradiente sem Regulacao');

% Plot Data - figura 3
% --------------------
fprintf(' => Visualizacao da fronteira ...\n\n');
plotDecisionBoundary(theta, X, y); # <<<<<<<<<<<<<<<<< TEMPLATE
hold on;
title('Fronteira de Decisao em data1');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
#hold off;

% Resultado final de theta
fprintf(' %f \n', theta);


#===================================================================================
# PARTE 2      modelo de hip�tese fronteira linear simples com otimizador fminunc
#===================================================================================


%% Re-inicializa��o
clear ; close all; clc
load data1.octave
[m, n] = size(X);

% Exame dos Dados
fprintf('Aula 2 - LOGistic Regression  v1.0.\n');
fprintf('***********************************\n');
fprintf('2a PARTE. Fronteira linear.\n\n');
amostra(X, 'Matriz X: ');
amostra(y, 'Matriz y: ');

% Plot Data - figura 1
% --------------------
fprintf('Plotting data: x1 x2 y ...\n\n');
plotData(X, y);
hold on;
title('Classificacao testes binarios em data1');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
hold off;
fprintf(' => Visualizacao dos dados.\n');
pause;


% Acrescentamos a coluna de 1s
X = [ones(m, 1) X];

% Semente inicial de zeros para theta
initial_theta = zeros(n + 1, 1);

% Custo inicial e gradiente
[cost, grad] = costFunction(initial_theta, X, y);
fprintf('Custo inicial (theta = zeros): %f\n', cost);

%% ============================= fminunc  ==================================
%  OTIMIZA��O atrav�s de uma fun��o built-in (fminunc).
%  N�o precisa escolher alpha nem o n�mero de itera��es. Eles est�o pr� - 
%  definidos nas op��es de fminunc. OBSERVE 30 itera��es m�x.

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 30);

%  Run fminunc
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
%% ===========================================================================


fprintf('Custo final encontrado por fminunc: %f\n', cost);
fprintf('Theta final encontrado por fminunc: \n');
fprintf(' %f \n', theta);

% Plot Data - figura 2
% --------------------
plotDecisionBoundary(theta, X, y);
hold on;
title('Fronteira de Decisao em data1');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
hold off;
fprintf(' => Visualizacao da Fronteira de Decisao.\n');
pause;

% Predi��o da classifica��o Simulado1 = 47.183 e Simulado2 = 85.501, Alfenas ou Andradina 
% ---------------------------------------------------------------------------------------
prob = sigmoid([1 47.183 85.501] * theta); # <<<<<<<<<<<<<< ESCREVER 
fprintf(['Para a cidade com 45.183 e 85.501 probabilidade: %f\n\n'], prob);

%  C�lculo da acur�cia do conjunto de treinamento
%  Obtemos a predi��o de todo o conjunto de treinamento usando nossa hip�tese. Ent�o
%  comparamos com os dados (y) e tiramos a m�dia.
p = predict(theta, X); # <<<<<<<<<<<<<< TEMPLATE
fprintf(' => Acuracia no treinamento: %f\n', mean(double(p == y)) * 100);



#====================================================================
# PARTE 3     modelo de hip�tese fronteira linear complexa
#====================================================================

% Re-Initializa��o
clear ; close all; clc
load data2.octave
[m, n] = size(X);

% Exame dos Dados
fprintf('Aula 2 - LOGistic Regression  v1.0.\n');
fprintf('***********************************\n');
fprintf('3a PARTE. Fronteira complexa.\n\n');
amostra(X, 'Matriz X: ');
amostra(y, 'Matriz y: ');

% Plot Data - figura 1
% --------------------
fprintf('Plotting data: x1 x2 y ...\n\n');
plotData(X, y);
hold on;
title('Classificacao testes binarios em data2');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
hold off;
fprintf(' => Visualizacao dos dados.\n');
pause;

% Acrescenta os atributos polinomiais
% Note que mapFeature tamb�m acrescenta a column de 1s para o INTERCEPT
X = mapFeature(X(:,1), X(:,2));
initial_theta = zeros(size(X, 2), 1);

% ***********************************************************
% Gradient Descent - COM REGULARIZA��O
% Varie este valor: % 0, 1, 10, 100, 1000, 0.5, -1.5
% ***********************************************************
lambda = 1;

% Compute custo inicial para regularized logistic regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);
fprintf('\nCusto inicial (J): %f  com regulacao lambda: %f \n', cost, lambda);

%% ===================================== fminunc  ============================================
%  OTIMIZA��O atrav�s de uma fun��o built-in (fminunc).
%  N�o precisa escolher alpha nem o n�mero de itera��es. Eles est�o pr�-definidos nas op��es
%  de fminunc. Neste caso h� REGULA��O.

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Run fminunc
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);
%% =============================================================================================

%  C�lculo da acur�cia no conjunto de treinamento
p = predict(theta, X);
fprintf('Acuracia no treinamento: %f\n\n', mean(double(p == y)) * 100);

% Plot da Fronteira de Decis�o - figura 2
% ---------------------------------------
plotDecisionBoundary(theta, X, y);
hold on;
title('Fronteira de Decisao em data2');
xlabel('Simulacao criterio 1');
ylabel('Simulacao criterio 2');
hold off;
fprintf(' => Visualizacao da Fronteira de Decisao.\n');

# eof

