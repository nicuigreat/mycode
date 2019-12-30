clc;
legend_index=1;
legend_m={};
figure(142)
hold on;grid on;
ActionMangerPlug_1=ActionManagerPlug;
% plot(ActionManger_1(:,3),'*');
% legend_m{legend_index}='speed no acc';legend_index=legend_index+1;
plot(ActionMangerPlug_1(:,5),'-.');
legend_m{legend_index}='speed slow down';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,6),'-s');
legend_m{legend_index}='speed stop';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,7),'-^');
legend_m{legend_index}='speed vs';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,8));
legend_m{legend_index}='speed cmd';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,9),'-s');
legend_m{legend_index}='start trigger';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,10),'-.');
legend_m{legend_index}='vehicle stop';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,15),'-*');
legend_m{legend_index}='stop dur obs';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,18),'-^');
legend_m{legend_index}='waiting for start trigger';legend_index=legend_index+1;

plot(ActionMangerPlug_1(:,21),'-^');
legend_m{legend_index}='speed no acc';legend_index=legend_index+1;


plot(ActionMangerPlug_1(:,20),'-^');
legend_m{legend_index}='manual or auto';legend_index=legend_index+1;


plot(ActionMangerPlug_1(:,16),'-.');
legend_m{legend_index}='real speed';legend_index=legend_index+1;





legend(legend_m)
