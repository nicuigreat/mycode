
% start_index=size(ataCollectionForGuo_27_AllData,1)-10000;
start_time=0;
end_time=4;
time_div=1;
SteerK=17.11;
step=1;
% win=find(ataCollectionForGuo_27_AllData(:,16)>166 & ataCollectionForGuo_27_AllData(:,16)<200);
% win=start_index:step:end_index;
% win=find(ataCollectionForGuo_27_AllData(:,1)/1000000/60>start_time & ataCollectionForGuo_27_AllData(:,1)/1000000/60<end_time);
% 
% start_index=win(1);
% end_index=win(end);
 

%%  ��ʱ��Ϊ������ ���Ƹ��� �ź�

legend_index=1;
legend_m={};
figure(136)
hold on;
MapController(:,1)=MapController(:,2)-MapController(1,2);
% plot(MapController(:,1)/time_div,MapController(:,19)/10,'-sb','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='Navi Index';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,MapController(:,23)*100,'-g','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='正行还是逆行';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,MapController(:,4)*180/pi,'-.g','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='DeltaAngleInPreview(deg)';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,MapController(:,11)*180/pi,'-.sg','LineWidth',1,'MarkerSize',2);% StartTrigger
% legend_m{legend_index}='vehicle yaw';legend_index=legend_index+1;
% 
plot(MapController(:,1)/time_div,(MapController(:,11)-MapController(:,17))*180/pi,'-.sb','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='orient error true(deg)';legend_index=legend_index+1;
% 
% orient_error2=MapController(:,11)-MapController(:,17);
% for i=1:size(orient_error2,1)
%     while (orient_error2(i) < -pi)
%         orient_error2(i) =orient_error2(i)+ 2 * pi;
%     end
%     while (orient_error2(i) > pi)
%         orient_error2(i) =orient_error2(i)- 2 * pi;
%     end
% end
% 
% plot(MapController(:,1)/time_div,orient_error2(:)*180/pi,'-.sb','LineWidth',1,'MarkerSize',2);% StartTrigger
% legend_m{legend_index}='orient error true 2(deg)';legend_index=legend_index+1;
% 
plot(MapController(:,1)/time_div,MapController(:,5)*100,'-.sm','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='lateral error(cm)';legend_index=legend_index+1;
% 
% plot(MapController(:,1)/time_div,MapController(:,6)*SteerK+9.11,'-.sr','LineWidth',1,'MarkerSize',2);% StartTrigger
% legend_m{legend_index}='SteerAngleInstruction(deg)';legend_index=legend_index+1;
% 
% % plot(MapController(:,1)/time_div,MapController(:,7)*100,'y-s','MarkerSize',2);%
% % legend_m{legend_index}='SpeedInstruction(km/h)';legend_index=legend_index+1;
% 
% plot(MapController(:,1)/time_div,MapController(:,20),'k-.s','LineWidth',1,'MarkerSize',2);% 
% legend_m{legend_index}='Read Steer(deg)';legend_index=legend_index+1;

plot(MapController(:,1)/time_div,MapController(:,21),'g-.s','MarkerSize',2);% 
legend_m{legend_index}='Read Speed(m/s)';legend_index=legend_index+1;

% off_line_steer=-MapController(:,12)+atan(0.8*MapController(:,5)./MapController(:,21));
% plot(MapController(:,1)/time_div,off_line_steer*180/pi*SteerK,'-.sb','MarkerSize',2);% 
% legend_m{legend_index}='SteerAngleInstruction off line deg';legend_index=legend_index+1;

% off_line_steer=-MapController(:,12)+atan(0.8*MapController(:,5)./0.8);
% plot(MapController(:,1)/time_div,off_line_steer*180/pi*SteerK,'-.sb','MarkerSize',2);% 
% legend_m{legend_index}='SteerAngleInstruction off line deg';legend_index=legend_index+1;

% off_line_steer1=-MapController(:,12);
% plot(MapController(:,1)/time_div,off_line_steer1*180/pi*SteerK,'-sg','MarkerSize',2);% 
% legend_m{legend_index}='SteerAngleInstruction orient off line dueg';legend_index=legend_index+1;
% % 
% off_line_steer2=atan(0.5*MapController(:,5)./MapController(:,21));
% 
% plot(MapController(:,1)/time_div,-off_line_steer2*180/pi*SteerK,'-sk','MarkerSize',2);% 
% legend_m{legend_index}='SteerAngleInstruction lateral off line deg';legend_index=legend_index+1;
% % 
% % off_line_steer2=atan(0.8*MapController(:,5)./0.5);
% % plot(MapController(:,1)/time_div,-off_line_steer2*180/pi*SteerK,'-sk','MarkerSize',2);% 
% % legend_m{legend_index}='SteerAngleInstruction lateral off line deg';legend_index=legend_index+1;
% 
% plot(MapController(:,1)/time_div,(-off_line_steer2+off_line_steer1)*180/pi*SteerK,'-sr','MarkerSize',2);% 
% legend_m{legend_index}='SteerAngleInstruction off line deg';legend_index=legend_index+1;

grid on;
% ylim([-600 600]);
legend(legend_m);
xlabel('ʱ�䣨s��');




legend_index=1;
legend_m={};
figure(138)
hold on;


plot(MapController(:,1)/time_div,MapController(:,6),'-.sr','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='SteerAngleInstruction(deg)';legend_index=legend_index+1;

% MapController(:,1)=MapController(:,2)-MapController(1,2);
% plot(MapController(:,1)/time_div,MapController(:,27),'-sb','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='lateral';legend_index=legend_index+1;
plot(MapController(:,1)/time_div,MapController(:,20),'k-.s','LineWidth',1,'MarkerSize',2);% 
legend_m{legend_index}='Read Steer(deg)';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,[diff(MapController(:,19)/10);0]*(-4000),'-b','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='Diff Navi Index';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,MapController(:,4)*180/pi,'-.g','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='DeltaAngleInPreview(deg)';legend_index=legend_index+1;
plot(MapController(:,1)/time_div,MapController(:,28),'-.sk','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='orient ';legend_index=legend_index+1;

plot(MapController(:,1)/time_div,MapController(:,29),'-.sm','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='preview';legend_index=legend_index+1;
legend(legend_m);

grid on;
legend_index=1;
legend_m={};
figure(139)
hold on;

% plot(MapController(:,1)/time_div,MapController(:,21)/7,'g-.s','MarkerSize',2);% 
% legend_m{legend_index}='Read Speed(km/h)';legend_index=legend_index+1;

plot(MapController(:,1)/time_div,MapController(:,6),'-.sr','LineWidth',1,'MarkerSize',2);% StartTrigger
legend_m{legend_index}='SteerAngleInstruction(deg)';legend_index=legend_index+1;

plot(MapController(:,1)/time_div,MapController(:,30)*180/pi,'-.sb','MarkerSize',2);% StartTrigger
legend_m{legend_index}='purpersuit';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,-MapController(:,6)*180/pi,'-.sg','MarkerSize',2);% StartTrigger
% legend_m{legend_index}='steer instuction';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,MapController(:,32)*180/pi,'-sk','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='delta angle';legend_index=legend_index+1;
% 
plot(MapController(:,1)/time_div,MapController(:,33)*100,'-sk','MarkerSize',4);% StartTrigger
legend_m{legend_index}='preview distance cm';legend_index=legend_index+1;


% purpersuit_offline=atan( sin( MapController(:,32) ) ./ ( MapController(:,33)/2.0/2.1 + cos(  MapController(:,32))    )    );
% plot(MapController(:,1)/time_div,purpersuit_offline,'-sg','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='purpersuit offline';legend_index=legend_index+1;

% plot(MapController(:,1)/time_div,[diff(MapController(:,19)/1

plot(MapController(:,1)/time_div,-MapController(:,31)*180/pi,'-.sm','MarkerSize',2);% StartTrigger
legend_m{legend_index}='stanley';legend_index=legend_index+1;
legend(legend_m);

grid on;

