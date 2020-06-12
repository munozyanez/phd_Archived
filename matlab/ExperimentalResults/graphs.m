clear; close all;

fig=figure; hold on;grid on;
fig2=figure; hold on;grid on;
leg=[];
linec=["k";"r";"g";"b"];


for i=0:2:6
data=csvread("data/stair/ada"+num2str(i)+"00response.csv");

t=data(:,1);
d1=data(:,2);
d2=data(:,3);


lc=linec(i/2+1);
figure(fig);
p1=plot(t,d1,lc);
figure(fig2);
p2=plot(t,d2,lc);%+'--');
leg = [leg ;"Payload "+num2str(i)+"00g"];

end
N=size(t,1);

figure(fig);
ylabel('Neck inclination (deg)');
xlabel('time (sec)');
legend(leg,'Location','best');
saveas(fig,'fig/adastairResponse','epsc');

figure(fig2);
ylabel('Control signal (rad/s)');
xlabel('time (sec)');
legend(leg,'Location','best');
saveas(fig2,'fig/adastairControl','epsc');




fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
    data=csvread("data/stair/adasysden"+num2str(i)+"00.csv");
%     data(1:800,:)=[];

    data2=csvread("data/stair/adasysnum"+num2str(i)+"00.csv");
%     data2(1:800,:)=[];


    t=data(:,1);
    d1=data(:,3);
    d2=data(:,4);
    d3=data(:,5);

    lc=linec(i/2+1);
    plot(t,d1,lc+'--');
    plot(t,d2,lc+'-.');
    plot(t,d3,lc);
    n1=data2(:,3);
    plot(t,n1,lc+':');
    leg = [leg ;"a2 "+num2str(i)+"00g";"a1 "+num2str(i)+"00g";"a0 "+num2str(i)+"00g";"b0 "+num2str(i)+"00g"];

    
    
end

ylabel(' Estimated model parameters');
xlabel('time (sec)');
ylim([-1.5,1.5]);

legend(leg,'NumColumns',4,'Location','best');
saveas(fig,'fig/adastairparameters','epsc');


fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
    data=csvread("data/stair/adasysden"+num2str(i)+"00.csv");
%     data(1:800,:)=[];

    data2=csvread("data/stair/adasysnum"+num2str(i)+"00.csv");
%     data2(1:800,:)=[];

    t=data(:,1);

    poles=[];
    M=size(data,2);
    SZ=size(data,1);
    for j=1:SZ
    poles=[poles, roots(data(j,3:M))]; %#ok<*AGROW>
    end
    
    lc=linec(i/2+1);
    plot(t,real(poles)',lc+':');
    plot(t,data2(:,3),lc);

    leg = [leg ;"z_1 "+num2str(i)+"00g";"z_2 "+num2str(i)+"00g";"k "+num2str(i)+"00g"];

    
    
end

ylabel('Model poles and gain');
xlabel('time (sec)');
ylim([0,1.1]);
legend(leg,'NumColumns',4,'Location','best');
saveas(fig,'fig/adastairzpk','epsc');





fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("data/stair/adasensor"+num2str(i)+"00response.csv");
% data(1:800,:)=[];


    t=data(:,1);
    phi=data(:,3);
    mag=data(:,2);
    
    lc=linec(i/2+1);
    plot(t,phi,lc+'--');
    plot(t,mag,lc);
    leg = [leg ;"Phase "+num2str(i)+"00g";"Magnitude "+num2str(i)+"00g"];

    

end

ylabel(' Phase (rad)          Magnitude	      ');
xlabel('time (sec)');
ylim([-3,3]);
legend(leg,'NumColumns',2,'Location','best');
saveas(fig,'fig/adastairphimag','epsc');




fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("data/stair/adacon"+num2str(i)+"00.csv");
% data(1:800,:)=[];


%     t=data(:,1);
    kp=data(:,2);
    ka=data(:,3);
    exp=data(:,4);

    lc=linec(i/2+1);
    plot(t,kp,lc+'--');
    plot(t,ka,lc);
    plot(t,exp,lc+'-.');
    leg = [leg ;"Kp "+num2str(i)+"00g";"Ka "+num2str(i)+"00g";"\alpha "+num2str(i)+"00g"];

end

ylabel(' Controller parameters');
xlabel('time (sec)');
legend(leg,'NumColumns',4,'Location','best');
saveas(fig,'fig/adastaircon','epsc');

skp=mean(kp(800:N));
ska=mean(ka(800:N));
sexp=-1;



