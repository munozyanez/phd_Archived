
clear;close all;

leg=[];
linec=["k";"r";"g";"b"];

fig=figure; hold on;grid on;

for i=0:2:6
data=csvread("data/step/fra"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,2);
    motor=data(:,3);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    leg = [leg ;"Neck "+num2str(i)+"00g";"Motor "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/frastepResponse','epsc');


fig=figure; hold on;grid on;

for i=0:2:6
data=csvread("data/step/int"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,2);
    motor=data(:,3);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    % legend('Neck inclination', 'Motor position','Location','best');

    leg = [leg ;"Neck "+num2str(i)+"00g";"Motor "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/intstepResponse','epsc');


%cs

fig=figure; hold on;grid on;

for i=0:2:6
data=csvread("data/step/fra"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,4);
    motor=data(:,5);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    leg = [leg ;"Neck "+num2str(i)+"00g";"Motor "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/frastepResponseCs','epsc');


fig=figure; hold on;grid on;

for i=0:2:6
data=csvread("data/step/int"+num2str(i)+"00stepresponse.csv");

    t=data(:,1);
    incli=data(:,4);
    motor=data(:,5);

    lc=linec(i/2+1);
    plot(t,incli,lc);
    plot(t,motor,lc+'--');
    % legend('Neck inclination', 'Motor position','Location','best');

    leg = [leg ;"Neck "+num2str(i)+"00g";"Motor "+num2str(i)+"00g"];

end

ylabel(' Motor position (rad)         Neck inclination (deg)        ');
xlabel('time (sec)');
legend(leg,'Location','best','NumColumns',2);
saveas(fig,'fig/intstepResponseCs','epsc');


