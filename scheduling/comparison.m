clear all;
close all;
clc;

%Parametros da simulacao
snr=1:20; % Faixa de snr (dB)
bc=10^8; %Hz
eta4g=0.75;
rho4g=0.8;
eta3g=0.6;
rho3g=0.4;
eta5g=0.9;
rho5g=0.9;

shannon=bc*log2(1+db2pow(snr));
shannon3g=eta3g*bc*log2(1+rho3g*db2pow(snr));
shannon4g=eta4g*bc*log2(1+rho4g*db2pow(snr));
shannon5g=eta5g*bc*log2(1+rho5g*db2pow(snr));

%plot de figuras
figure;
grid on;
hold on;
plot(snr,shannon/10^6,'--','LineWidth',2);

plot(snr,shannon3g/10^6,'-','LineWidth',2);

plot(snr,shannon4g/10^6,'-','LineWidth',2);

plot(snr,shannon5g/10^6,'-','LineWidth',2);
xlabel('SNR [dB]','Interpreter','latex')
ylabel('Capacity [Mbps]','Interpreter','latex')
legend('Theoretical','3G','4G','5G','Location','southeast','Interpreter','latex');
