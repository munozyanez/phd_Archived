

fig=figure; hold on;grid on;


data=csvread("data/fra000stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/fra200stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/fra400stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

data=csvread("data/fra600stepresponse.csv")
t=data(:,1);
incli=data(:,2);
motor=data(:,3);
plot(t,incli);
plot(t,motor);

ylabel(' Position (rad)          Inclination (deg)      ');
xlabel('time (s)');
legend('Neck inclination', 'Motor position','Location','best');
saveas(fig,'fig/avgtimeResponse','epsc');



