data=csvread("data/id/sensor000response.csv")
t=data(:,1);
mag=data(:,2);
phi=data(:,3);


fig=figure; hold on;grid on;

plot(t,mag);
plot(t,phi);
ylabel(' Phase (rad)         Magnitude          ');
xlabel('time (sec)');
legend('Magnitude','Phase')

saveas(fig,'fig/phim_w3','epsc');
