clear; close all;


datan=csvread("data/frasysnum000.csv");
datad=csvread("data/frasysden000.csv");

N=size(datan,2);
M=size(datad,2);


t=datan(:,1);
SZ=size(datan,1);

fig=figure; hold on;grid on;
leg=[];

markers= ["b";"r";"g";"m"];
markersn= ["b--";"r--";"g--";"m--"];
poles=[];
nums=figure;
dens=figure;
poles=figure;

for i=0:2:6
datan=csvread("./data/frasysnum"+num2str(i)+"00.csv");
datad=csvread("./data/frasysden"+num2str(i)+"00.csv");
np=plot(t,datan(:,3:N),markersn(i/2+1));
dp=plot(t,datad(:,4:M),markers(i/2+1));

leg = [leg ;"b0 ("+num2str(i)+"00 g)";"a0 ("+num2str(i)+"00 g)" ;"a1 ("+num2str(i)+"00 g)"];

end


ylabel(' System parameters ');
xlabel('time (sec)');
legend(leg,'Location','south');
leg=[];
saveas(fig,'../fraParams','epsc');





fig=figure;hold on;
plot(t,real(poles)');
plot(t,datan(:,3:N));

ylabel('Roots and gain of model');
xlabel('time (sec)');
legend('Pole 1', 'Pole 2', 'Gain','Location','best');
ylim([-1.5 1.5]);
saveas(fig,'fig/avgpoleConverge','epsc');


fig=figure; hold on;grid on;
leg=[];


for i=0:2:6
data=csvread("../data/final/time"+num2str(i)+"00response.csv");
t=data(:,1);
d1=data(:,2);
d2=data(:,3);



plot(t,d1);
plot(t,d2,'--');

leg = [leg ;"Neck inc. "+num2str(i)+"00 g";"Motor pos. "+num2str(i)+"00 g"];

end

N=size(t,1);
ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (sec)');
legend(leg,'Location','northwest');
saveas(fig,'../adatimeResponse','epsc');





fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
    data=csvread("../data/final/adasysden"+num2str(i)+"00.csv");
    data2=csvread("../data/final/adasysnum"+num2str(i)+"00.csv");
    t=data(:,1);
    d1=data(:,3);
    d2=data(:,4);
    d3=data(:,5);

    plot(t,d1);
    plot(t,d2);
    plot(t,d3);
    n1=data2(:,3);
    plot(t,n1);

    leg = [leg ;"Neck inc. "+num2str(i)+"00 g";"Motor pos. "+num2str(i)+"00 g"];

end

ylabel(' Estimated model parameters');
xlabel('time (sec)');
ylim([-1.5,1.5]);

% legend(leg,'Location','northwest');
saveas(fig,'../adaparameters','epsc');





fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("../data/final/sensor"+num2str(i)+"00response.csv");
    t=data(:,1);
    phi=data(:,3);
    mag=data(:,2);

    plot(t,phi,'--');
    plot(t,mag);


    leg = [leg ;"Phase "+num2str(i)+"00 g";"Magnitude "+num2str(i)+"00 g"];

end

ylabel(' Phase (rad)          Magnitude	      ');
xlabel('time (sec)');
ylim([-3,3]);
legend(leg,'Location','west');
saveas(fig,'../adaphimag','epsc');




fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("../data/final/adacon"+num2str(i)+"00.csv");
%     t=data(:,1);
    kp=data(:,2);
    ka=data(:,3);
    exp=data(:,4);

    plot(t,kp,'--');
    plot(t,ka);
    plot(t,exp);


    leg = [leg ;"Kp "+num2str(i)+"00 g";"Ka "+num2str(i)+"00 g";"alpha "+num2str(i)+"00 g"];

end

ylabel(' Controller parameters');
xlabel('time (sec)');
legend(leg,'Location','northwest');
saveas(fig,'../adacon','epsc');

skp=mean(kp(800:N));
ska=mean(ka(800:N));
sexp=-1;



