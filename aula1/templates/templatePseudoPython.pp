#==============================================================================
## Laboratório de Álgebra Linear Numérica
#
# <nome do arquivo de pseudo-python>.pp
# dd/mm/aa
# autor: <nome dos autores ou do grupo>
# email: <email dos autores>
#
#==============================================================================
 
% Pseudo-Python
% -------------
%
% Esta é uma forma de pseudo-código para descrever algoritmos que está baseada
% na linguagem Python. É utilizada para permitir expressar um procedimento sem
% se preocupar com o formalismo e, se preciso, à mão. Exige poucas informações
% como: ENTRADA, SAÍDA e PARADA.
%
% Utiliza a filosofia do Python e a simplicidade do Octave, não é formal.
%
% 1 Cada passo do procedimento fica em uma linha, não há sinal de terminação.
% 2 A identação é usada para definir bloco, exatamente como no Python.
% 3 Os laços e contadores tem o estilo do Octave.
% 4 As palavras reservadas são do Python (não há obrigação de seguir a sintaxe).
% 5 Palavras em Português são usandas livremente para abreviar procedimentos.
% 6 Comentários são identificados com # ou % ou ainda entre aspas  """  """
%         
%  EXEMPLO 1:
%           Descrever um procedimento para calcular a somatória de n números.
%
%           Pseudo-Python:
%           Entrada: n, x1, x2, ...xn, ...xm
%           Saída: S a soma dos n primeiros números
%
%           S = 0           # lembrar de inicializar a soma
%           for i=1:n
%               soma os números até n
%           return S
%           pare
%
%  EXEMPLO 2:
%           Descrever um algoritmo para calcular o valor do ponto fixo.
%           O ponto fixo p de uma dada função é o número que iguala f(p) = p
%           É um problema semelhante a achar as raízes, geometricamente é o
%           encontro entre o gráfico da função e uma reta pela origem.
%
%           Pseudo-Python:
%           Entrada: p0 aproximação inicial, delta tolerância, n número máximo de iterações
%           Saída: p valor aproximado ou mensagem de erro
% 
%           for i = 1:n
%               p = f(p0)           # substituir pela função específica
%               if |p - p0| < delta
%                   return p
%                   pare
%               i = i+1
%               p0 = p
%           mostrar a mensagem "o método não convergiu após n iterações"
%           pare               
%



end
