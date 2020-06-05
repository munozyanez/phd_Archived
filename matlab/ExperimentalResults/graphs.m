clear; close all;

fig=figure; hold on;grid on;
leg=[];
linec=["k";"r";"g";"b"];

for i=0:2:6
data=csvread("data/stair/ada"+num2str(i)+"00response.csv");
data(1:800,:)=[];

t=data(:,1);
d1=data(:,2);
d2=data(:,3);


lc=linec(i/2+1);
p1=plot(t,d1,lc);
p2=plot(t,d2,lc+'--');

leg = [leg ;"Neck "+num2str(i)+"00 g";"Motor "+num2str(i)+"00 g"];
% leg = [leg ;num2str(i)+"00 g";num2str(i)+"00 g"];

end

N=size(t,1);
ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/adatimeResponse','epsc');





fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
    data=csvread("data/stair/adasysden"+num2str(i)+"00.csv");
    data(1:800,:)=[];

    data2=csvread("data/stair/adasysnum"+num2str(i)+"00.csv");
    data2(1:800,:)=[];

    lc=linec(i/2+1);

    t=data(:,1);
    d1=data(:,3);
    d2=data(:,4);
    d3=data(:,5);

    plot(t,d1,lc);
    plot(t,d2,lc);
    plot(t,d3,lc);
    n1=data2(:,3);
    plot(t,n1,lc+'--');

    leg = [leg ;"a0|"+num2str(i)+"00 g";"a1|"+num2str(i)+"00 g";"a2|"+num2str(i)+"00 g";"b0|"+num2str(i)+"00 g"];

end

ylabel(' Estimated model parameters');
xlabel('time (sec)');
ylim([-1.5,1.5]);

legend(leg,'Location','northwest');
saveas(fig,'fig/adaparameters','epsc');





fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("data/stair/adasensor"+num2str(i)+"00response.csv");
data(1:800,:)=[];

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
legend(leg,'Location','south');
saveas(fig,'fig/adaphimag','epsc');




fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("data/stair/adacon"+num2str(i)+"00.csv");
data(1:800,:)=[];

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
legend(leg,'Location','south');
saveas(fig,'fig/adacon','epsc');

skp=mean(kp(800:N));
ska=mean(ka(800:N));
sexp=-1;



