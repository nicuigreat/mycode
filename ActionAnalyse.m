
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 
% start_index=size(ataCollectionForGuo_27_AllData,1)-10000;
start_time=0;
end_time=4;
time_div=1;

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
figure(133)
hold on;
ActionManager(:,1)=ActionManager(:,2)-ActionManager(1,2);
% plot(ActionManager(:,1)/time_div,ActionManager(:,3)*100,'-sb','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='Speed cmd(m/s)';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,4)*10,'-*y','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='Accelerate cmd';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,5),'s-.r','MarkerSize',1);% StartTrigger
% legend_m{legend_index}='Steer cmd(deg)';legend_index=legend_index+1;

plot(ActionManager(:,1)/time_div,ActionManager(:,27),'s-.g','MarkerSize',1);% StartTrigger
legend_m{legend_index}='Steer cmd cali(deg)';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,6)*100,'-*c','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='AutoDriveSwitch';legend_index=legend_index+1;
% plot(ActionManager(:,1)/time_div,ActionManager(:,7)*100,'-sr','MarkerSize',8);% StartTrigger
% legend_m{legend_index}='Lidar 1 StopCmd';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,8)*100,'-sm','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='StationStopCmd';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,9)*100,'-sc','MarkerSize',8);% StartTrigger
% legend_m{legend_index}='Lidar 1 SlowdownFlag';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,12)*100,'-*m','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='StopByKeyboardFlag';legend_index=legend_index+1;
% 
% plot(ActionManager(:,1)/time_div,ActionManager(:,17)*100,'-^c','MarkerSize',5);% StartTrigger
% legend_m{legend_index}='Lidar 16 StopCmd';legend_index=legend_index+1;
% 
% 
% plot(ActionManager(:,1)/time_div,ActionManager(:,18)*100,'-^k','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='Lidar 16 SlowdownFlag';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,19)*100,'-^k','MarkerSize',8);% StartTrigger
% legend_m{legend_index}='Lidar 16 RefSpeed(cm/s)';legend_index=legend_index+1;

plot(ActionManager(:,1)/time_div,ActionManager(:,14)*100,'s-.r','MarkerSize',4);% StartTrigger
legend_m{legend_index}='Real Speed(cm/s)';legend_index=legend_index+1;


plot(ActionManager(:,1)/time_div,ActionManager(:,15),'s-.k','MarkerSize',4);% StartTrigger
legend_m{legend_index}='Real Steer(deg)';legend_index=legend_index+1;

% plot(ActionManager(:,1)/time_div,ActionManager(:,17),'r','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='PositonRrror';legend_index=legend_index+1;
% 
% 		ptr_debug_info->float_vector.at(7)=AutoRunState;
% 		ptr_debug_info->float_vector.at(8)=AllowRunWhatever;
% 		ptr_debug_info->float_vector.at(9)=StopByKeyboardFlag;
% 		ptr_debug_info->float_vector.at(10)=obs_stop_info.RefSpeed;
% 		ptr_debug_info->float_vector.at(11)=speed_mil_steer_feedback.Speed;
% 		ptr_debug_info->float_vector.at(12)=speed_mil_steer_feedback.Steer;
% 		ptr_debug_info->float_vector.at(13)=speed_mil_steer_feedback.Mileage;
% 		ptr_debug_info->float_vector.at(14)=lidar16_obs_stop_info.StopCmd;
% 		ptr_debug_info->float_vector.at(15)=lidar16_obs_stop_info.SlowdownFlag;
% 		ptr_debug_info->float_vector.at(16)=lidar16_obs_stop_info.RefSpeed;	

grid on;
% ylim([-600 600]);
legend(legend_m);
xlabel('ʱ�䣨�룩');


clc;

%%
fprintf('===============================================\n')
col=6;
df=diff(ActionManager(:,col));
df=ActionManager(find(df==-1),[1,col]);
fprintf('�Զ��л�Ϊ�ֶ�����: %d \n',size(df,1))
for i=1:size(df,1)
    fprintf('�� %d �� ���ʱ�䣺%.0f\n',i,df(i,1)/time_div)
end
fprintf('===============================================\n')

col=7;
df=diff(ActionManager(:,col));
df=ActionManager(                                                                                                                                                                                                                                                                                                      find(df==1),[1,col]);
fprintf('���߱��ϴ���: %d\n',size(df,1))
for i=1:size(df,1)
    fprintf('�� %d �� ���ʱ�䣺%.0f\n',i,df(i,1)/time_div)
end
fprintf('===============================================\n')
col=17;
df=diff(ActionManager(:,col));
df=ActionManager(find(df==1),[1,col]);
fprintf('16�߱��ϴ���: %d\n',size(df,1))
for i=1:size(df,1)
    fprintf('�� %d �� ���ʱ�䣺%.0f\n',i,df(i,1)/time_div)
end
fprintf('===============================================\n')
col=8;
df=diff(ActionManager(:,col));
df=ActionManager(find(df==1),[1,col]);
fprintf('��վͣ������: %d\n',size(df,1))
for i=1:size(df,1)
    fprintf('�� %d �� ���ʱ�䣺%.0f\n',i,df(i,1)/time_div)
end


fprintf('===============================================\n')
col=12;
df=diff(ActionManager(:,col));
df=ActionManager(find(df==1),[1,col]);
fprintf('ң����ͣ������: %d\n',size(df,1))
for i=1:size(df,1)
    fprintf('�� %d �� ���ʱ�䣺%.0f\n',i,df(i,1)/time_div)
end
fprintf('===============================================\n')
Action_time=ActionManager(:,2);
fprintf('�Զ���ʻ�������ʱ��: %s\n',datestr((Action_time(1,1)-3600*24+8*3600)/86400 + 70*365+19))
fprintf('===============================================\n')
fprintf('�Զ���ʻ���ֹͣʱ��: %s\n',datestr((Action_time(end-1,1)-3600*24+8*3600)/86400 + 70*365+19))
fprintf('===============================================\n')
test_duration=Action_time(end-1,1)-Action_time(1,1);
fprintf('�Զ���ʻ���ֹͣʱ��: %.1f �� = %.1f ���� = %.1f Сʱ\n',test_duration,test_duration/60,test_duration/3600)
fprintf('===============================================\n')

mil_duration=ActionManager(end-1,16)-ActionManager(1,16);
fprintf('�������: %.1f m = %.3f km\n',mil_duration,mil_duration/1000);
fprintf('===============================================\n')

mile=mil_duration;
time_duration=test_duration;
%���³�����������¼��̡�ʱ�䡢��Ԥ����������ͣ�����������ݣ���¼��excel�� 
filename = 'testdata.xlsx';
A = [mile,time_duration];
sheet = 2;
xlRange = 'A1';
xlswrite(filename,A,sheet,xlRange);


