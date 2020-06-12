
clear;close all;

linec=["k";"r";"g";"b"];

fig=figure; hold on;grid on;
fig2=figure; hold on;grid on;
leg=[];

for i=0:2:6
data=csvread("data/step/fra"+num2str(i)+"00stepresponse.csv");

t=data(:,1)-20;
d1=data(:,2);
d2=data(:,5);


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
saveas(fig,'fig/frastepResponse','epsc');

figure(fig2);
ylabel('Control signal (rad/s)');
xlabel('time (sec)');
legend(leg,'Location','best');
saveas(fig2,'fig/frastepControl','epsc');


fig=figure; hold on;grid on;
fig2=figure; hold on;grid on;
leg=[];

for i=0:2:6
data=csvread("data/step/int"+num2str(i)+"00stepresponse.csv");

t=data(:,1)-20;
d1=data(:,2);
d2=data(:,5);


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
saveas(fig,'fig/intstepResponse','epsc');

figure(fig2);
ylabel('Control signal (rad/s)');
xlabel('time (sec)');
legend(leg,'Location','best');
saveas(fig2,'fig/intstepControl','epsc');


%cs
leg=[];
fig=figure; hold on;grid on;

for i=0:2:6
data=csvread("data/step/fra"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,4);
    motor=data(:,5);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    leg = [leg ;"Neck "+num2str(i)+"00g";"Control "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/frastepResponseCs','epsc');


fig=figure; hold on;grid on;
leg=[];
for i=0:2:6
data=csvread("data/step/int"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,4);
    motor=data(:,5);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    % legend('Neck inclination', 'Motor position','Location','best');

    leg = [leg ;"Neck "+num2str(i)+"00g";"Control "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/intstepResponseCs','epsc');


