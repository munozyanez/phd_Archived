clear; close all;

dts=0.02;
z=tf('z',0.02);
s=tf('s');

datan=csvread("data/sysnum000.csv");
datad=csvread("data/sysden000.csv");

N=size(datan,2);
M=size(datad,2);


t=datan(:,1);
SZ=size(datan,1);


fig=figure; hold on;
plot(t,datan(:,3:N));
plot(t,datad(:,4:M));
ylabel('RLS parameter result');
xlabel('time (sec)');
legend('b_0', 'a_1', 'a_0','Location','best');
ylim([-1.5 1.5]);
saveas(fig,'fig/avgparameterConverge','epsc');

poles=[];
for i=1:SZ
poles=[poles, roots(datad(i,3:M))]; %#ok<*AGROW>
end



fig=figure;hold on;
plot(t,real(poles)');
plot(t,datan(:,3:N));

ylabel('Roots and gain of model');
xlabel('time (sec)');
legend('Pole 1', 'Pole 2', 'Gain','Location','best');
ylim([-1.5 1.5]);
saveas(fig,'fig/avgpoleConverge','epsc');

%figure;
%plot(imag(poles)');
%ylim([-1 1]);

sys=minreal( tf(mean(datan(100:SZ,3:N)),mean(datad(100:SZ,3:M)),dts) );
[z,p,k]=zpkdata(sys);
S2=zpk(z,round(p{1},3),k,dts);


fig=figure;hold on;
margin(sys);
margin(S2);
legend('Average plant', 'Rounded poles plant', 'Location','best');
saveas(fig,'fig/avgsysBode','epsc');


fig=figure;hold on;
F=minreal (sys/(1+sys));
step(F);

step(feedback(S2,1));
ylabel('Inclination (deg)');
xlabel('time (sec)');
legend('Average plant', 'Rounded poles plant', 'Location','best');
saveas(fig,'fig/avgsysTR','epsc');

