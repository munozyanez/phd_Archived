clear;close all;
% data=csvread("data/id000response.csv")
% t=data(:,1);
% incli=data(:,2);
% motor=data(:,3);
% 
% 
% fig=figure; hold on;grid on;
% 
% plot(t,incli);
% plot(t,motor);
% 
% ylabel(' Position (rad)          Inclination (deg)      ');
% xlabel('time (s)');
% legend('Neck inclination', 'Motor position','Location','best');
% saveas(fig,'fig/avgtimeResponse','epsc');

fig=figure; hold on;grid on;


data=csvread("data/step/fra000stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/fra200stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/fra400stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/fra600stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (s)');
legend('Neck inclination', 'Motor position','Location','best');
saveas(fig,'fig/fratimeResponse','epsc');

fig=figure; hold on;grid on;


data=csvread("data/step/int000stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/int200stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/int400stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/step/int600stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (s)');
legend('Neck inclination', 'Motor position','Location','best');
saveas(fig,'fig/inttimeResponse','epsc');


