clear;close all;

fig=figure; hold on;grid on;
fig2=figure; hold on;grid on;
leg=[];
linec=["k";"r";"g";"b"];


for i=0
data=csvread("data/stair/fra"+num2str(i)+"00response.csv");

t=data(:,1)-20;
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
saveas(fig,'fig/exp000Response','epsc');

figure(fig2);
ylabel('Control signal (rad/s)');
xlabel('time (sec)');
legend(leg,'Location','best');
saveas(fig2,'fig/exp000Control','epsc');


fig=figure; hold on;grid on;
    SZ=size(data,1);
unos=ones(fix(SZ/7),1);
refs=[15*unos; 20*unos ;25*unos ;30*unos; 25*unos; 20*unos ;15*unos; [0 0 0 0]'];
plot(t,refs,'.')
ylabel('Neck inclination target (deg)');
xlabel('time (sec)');
saveas(fig,'fig/exp000References','epsc');



fig=figure; hold on;grid on;
leg=[];
for i=0
    data=csvread("data/stair/frasysden"+num2str(i)+"00.csv");
%     data(1:800,:)=[];

    data2=csvread("data/stair/frasysnum"+num2str(i)+"00.csv");
%     data2(1:800,:)=[];


%     t=data(:,1);
    d1=data(:,2);
    d2=data(:,3);
    d3=data(:,4);

    lc=linec(i/2+1);
    plot(t,d1,lc+'--');
    plot(t,d2,lc+'-.');
    plot(t,d3,lc);
    n1=data2(:,2);
    plot(t,n1,lc+':');
    leg = [leg ;"a2 "+num2str(i)+"00g";"a1 "+num2str(i)+"00g";"a0 "+num2str(i)+"00g";"b0 "+num2str(i)+"00g"];

    
    
end

ylabel(' Estimated model parameters');
xlabel('time (sec)');
ylim([-1.5,1.5]);

legend(leg,'NumColumns',4,'Location','best');
saveas(fig,'fig/exp000parameters','epsc');




fig=figure; hold on;grid on;
leg=[];
for i=0
    data=csvread("data/stair/frasysden"+num2str(i)+"00.csv");
%     data(1:800,:)=[];

    data2=csvread("data/stair/frasysnum"+num2str(i)+"00.csv");
%     data2(1:800,:)=[];

%     t=data(:,1);

    poles=[];
    M=size(data,2);
    SZ=size(data,1);
    for j=1:SZ
    poles=[poles, roots(data(j,2:M))]; %#ok<*AGROW>
    end
    
    lc=linec(i/2+1);
    plot(t,poles',lc+':');
    plot(t,data2(:,2),lc);

    leg = [leg ;"z_1 "+num2str(i)+"00g";"z_2 "+num2str(i)+"00g";"k "+num2str(i)+"00g"];

    
    
end

ylabel('Model poles and gain');
xlabel('time (sec)');
ylim([0,1.1]);
legend(leg,'NumColumns',4,'Location','best');
saveas(fig,'fig/exp000zpk','epsc');




