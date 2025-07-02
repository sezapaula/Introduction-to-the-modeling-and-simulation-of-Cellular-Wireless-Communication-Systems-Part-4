clc; clear all;

% Parâmetros desejados (média e desvio padrão em escala linear)
mu_linear = 8;       % média em Mbytes
sigma_linear = 2;    % desvio padrão em Mbytes

% Convertemos para os parâmetros da distribuição lognormal
% A lognormal é definida como exp(X), onde X ~ N(mu, sigma^2)
sigma_logn = sqrt(log(1 + (sigma_linear/mu_linear)^2));
mu_logn = log(mu_linear) - 0.5 * sigma_logn^2;

% Gerar amostra de números aleatórios lognormais
N = 1e7; % número de amostras
samples = lognrnd(mu_logn, sigma_logn, [N, 1]);

% Calcular média e desvio padrão das amostras geradas
mean_generated = mean(samples);
std_generated = std(samples);

% Exibir resultados
fprintf('Média gerada: %.2f Mbytes\n', mean_generated);
fprintf('Desvio padrão gerado: %.2f Mbytes\n', std_generated);

% Verificar quantos valores estão fora do intervalo [3, 20] Mbytes
out_of_bounds = sum(samples < 3 | samples > 20);
fprintf('Amostras fora do intervalo [3, 20] Mbytes: %d (%.2f%%)\n', ...
    out_of_bounds, 100 * out_of_bounds / N);

% Plotar histograma e PDF teórica
figure;
histogram(samples, 50, 'Normalization', 'pdf');
hold on;

% Curva teórica da densidade lognormal
x = linspace(0, max(samples), 1000);
pdf_theoretical = lognpdf(x, mu_logn, sigma_logn);
plot(x, pdf_theoretical, 'r', 'LineWidth', 2);
xlabel('[Mbytes]','Interpreter','latex');
ylabel('Density',Interpreter='latex');
legend('Generated samples', 'Theoretical PDF','Interpreter','latex');
grid on;
