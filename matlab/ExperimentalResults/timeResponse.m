clear;close all;
data=csvread("data/id000response.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);


fig=figure; hold on;grid on;

plot(t,incli);
plot(t,motor);

ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (s)');
legend('Neck inclination', 'Motor position','Location','best');
saveas(fig,'fig/avgtimeResponse','epsc');

fig=figure; hold on;grid on;


data=csvread("data/000stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/200stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/400stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/600stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (s)');
legend('Neck inclination', 'Motor position','Location','best');
saveas(fig,'fig/avgtimeResponse','epsc');



