%������°�����ݣ�û�дŶ������Կ�ܶ�����??(�����ں�ǰ��GPS��
% NaviMap=road;
% MapPoint=NaviMap;
GpsEKF_1=GpsEKF;
Time=GpsEKF_1(:,1);
after_merge=GpsEKF_1(:,[3,4,5]);
after_casting=GpsEKF_1(:,[14,15,16]);
init_gps=GpsEKF_1(:,[11,12,13]);
speed=GpsEKF_1(:,9);
steer=GpsEKF_1(:,10)*180/pi;
% yaw_rate_from_IMU=GpsEKF_1(:,19)-(-0.0002499517);
yaw_rate_from_IMU=GpsEKF_1(:,19);
ExpectZeroOffsetPoint=5;

Mil=GpsEKF_1(:,6);

% cur=sin(steer)/2.10;
% yaw_rate_from_steer=-speed.*tan(steer*15.75/15.319)/2.86;
% 
% figure(456);hold on;grid on;
% plot(GpsEKF_1(:,1)-GpsEKF_1(1,1),yaw_rate_from_IMU,'r-s');
% plot(GpsEKF_1(:,1)-GpsEKF_1(1,1),yaw_rate_from_steer,'b-s');
% legend({'yaw rate from IMU','yaw rate from steer'});
%% time signal plot
% legend_index=1;
% legend_m={};
% figure(1)
% hold on;
% 
% plot(Time,Delta_AngleInPreview*180/pi,'-*b','MarkerSize',3);
% legend_m{legend_index}='DeltaAngleInPreview';legend_index=legend_index+1;
% plot(Time,delta_angle_in_project_point*180/pi,'-*r','MarkerSize',3);
% legend_m{legend_index}='DAngleInProject';legend_index=legend_index+1;
% plot(Time,Current_Lateral_Deviation*100,'-*g','MarkerSize',3);
% legend_m{legend_index}='CurrentLateralDeviation';legend_index=legend_index+1;
% 
% plot(Time,Controller_SteerAngleInstruction*17,'-.k','MarkerSize',3);
% legend_m{legend_index}='ControllerSteerAngleInstruction';legend_index=legend_index+1;
% plot(Time,Controller_SpeedInstruction*100,'-sk','MarkerSize',3);
% legend_m{legend_index}='ControllerSpeedInstruction';legend_index=legend_index+1;
% 
% plot(Time,Real_Steer_Feedback_In,'-.r','MarkerSize',3);
% legend_m{legend_index}='RealSteerFeedbackIn';legend_index=legend_index+1;
% plot(Time,Real_Speed_Feedback_In*100,'-sk','MarkerSize',3);
% legend_m{legend_index}='Real_Speed_Feedback_In';legend_index=legend_index+1;
% 
% plot(Time,AllData(:,28)*50,':bo','MarkerSize',3);

% legend_m{legend_index}='�ߵ���';legend_index=legend_index+1;
% 
% grid on;
% legend(legend_m);

%%   position map

figure(122);
hold on;
legend_index=1;
legend_m={};

% plot(MapPoint(:,1),MapPoint(:,2),'-ok');
% legend_m{legend_index}='Mag Point';legend_index=legend_index+1;

plot(after_merge(:,1),after_merge(:,2),'-*r');
legend_m{legend_index}='Car Position';legend_index=legend_index+1;

plot(init_gps(:,1),init_gps(:,2),'-xm');
legend_m{legend_index}='atanna';legend_index=legend_index+1;
% plot(init_gps(end,1),init_gps(end,2),'.','MarkerSize',20)
plot(after_casting(:,1),after_casting(:,2),'-xc');
legend_m{legend_index}='casting';legend_index=legend_index+1;

% control_point=[after_merge(:,1)+ExpectZeroOffsetPoint*cos(after_merge(:,3)),after_merge(:,2)+ExpectZeroOffsetPoint*sin(after_merge(:,3))];
% plot(control_point(:,1),control_point(:,2),'-xb');
% legend_m{legend_index}='control point';legend_index=legend_index+1;


% control_point2=[after_merge(:,1)+-1*cos(after_merge(:,3)),after_merge(:,2)+-1*sin(after_merge(:,3))];
% plot(control_point2(:,1),control_point2(:,2),'-xb');
% legend_m{legend_index}='control point2';legend_index=legend_index+1;

% flag_of_speed=[init_gps(:,1)+(speed.*5).*cos(init_gps(:,3)-pi/2),init_gps(:,2)+(speed.*5).*sin(init_gps(:,3)-pi/2)];
% plot(flag_of_speed(:,1),flag_of_speed(:,2),'.:g');
% legend_m{legend_index}='flag of speed';legend_index=legend_index+1;

% dXY=diff(after_merge);
% orientation=atan2(dXY(:,2),dXY(:,1));
% Orientation=[orientation;orientation(end)];

% flag_of_QI=[before_merge(:,1)+5.*(before_merge(:,3)-4).*cos(Orientation-pi/2),before_merge(:,2)+5.*(before_merge(:,3)-4).*sin(Orientation-pi/2)];
% plot(flag_of_QI(:,1),flag_of_QI(:,2),':rd','MarkerSize',5);
% legend_m{legend_index}='flagofQI';legend_index=legend_index+1;
% 
% flag_of_xingshu=[before_merge(:,1)+(GpsEKF_1(:,17)).*cos(Orientation-pi/2),before_merge(:,2)+(GpsEKF_1(:,17)).*sin(Orientation-pi/2)];
% plot(flag_of_xingshu(:,1),flag_of_xingshu(:,2),':gd','MarkerSize',5);
% legend_m{legend_index}='flagofxingshu';legend_index=legend_index+1;

%% 
% for i=1:10:size(GpsEKF_1(:,2))
% 
%         text(before_merge(i,1),before_merge(i,2),num2str(GpsEKF_1(i,17)));
% end
%%
% for i=1:5:size(GpsEKF_1(:,2))
% 
%         text(before_merge(i,1),before_merge(i,2),num2str(GpsEKF_1(i,18)));
% end
% 
% QI
% for i=1:1:size(GpsEKF_1(:,2))
% i
% %     text( after_merge(i,1),after_merge(i,2),num2str(speed(i)) );
%     if GpsEKF_1(i,16)~=4
%         text(init_gps(i,1),init_gps(i,2),num2str(GpsEKF_1(i,16)));
%     end
% end

% for i=1:10:size(GpsEKF_1(:,2))
% 
% %     text( after_merge(i,1)+1,after_merge(i,2),num2str(i),'Color','b' );
% end

% for i=1:1:size(GpsEKF_1(:,2))
%  
%         text(after_merge(i,1),after_merge(i,2),num2str(GpsEKF_1(i,7)));
% end


%  gps_raw=AllData(:,[24,25])+[(AllData(:,26)-4).*cos(GPS_EKF(:,3)-pi/2)*5,(AllData(:,26)-4).*sin(GPS_EKF(:,3)-pi/2)*5];
%  plot(gps_raw(:,1),gps_raw(:,2),'-sb');
%  legend_m{legend_index}='raw with QI';legend_index=legend_index+1;



% % plot(UsedEKF_PosAngle(:,1),UsedEKF_PosAngle(:,2),'-*b');
% % legend_m{legend_index}='ControlPoint';legend_index=legend_index+1;
% plot(GPS_EKF(:,1)+expectOffset*cos(GPS_EKF(:,3)),GPS_EKF(:,2)+expectOffset*sin(GPS_EKF(:,3)),'-*b');
% legend_m{legend_index}='ControlPoint';legend_index=legend_index+1;
% 
% AddSpeedPos=GPS_EKF(:,1:2)+[Real_Speed_Feedback_In.*cos(GPS_EKF(:,3)-pi/2),Real_Speed_Feedback_In.*sin(GPS_EKF(:,3)-pi/2)];
% plot(AddSpeedPos(:,1),AddSpeedPos(:,2),'-.g');
% legend_m{legend_index}='CarPosWithSpeed';legend_index=legend_index+1;
% 
% for i=1:10:size(MapPoint(:,2))
%      
%     text(MapPoint(i,1),MapPoint(i,2),num2str(MapPoint(i,3)));
% end
% 
% 
for i=1:10:size(after_merge,1)
     
%     text(init_gps(i,1),init_gps(i,2),num2str(i));
%     plot([control_point(i,1);after_merge(i,1)],[control_point(i,2);after_merge(i,2)],'k')
%     plot([init_gps(i,1);after_casting(i,1);after_merge(i,1)],[init_gps(i,2);after_casting(i,2);after_merge(i,2)],'k')
end

%%
% for i=1:size(MapPoint(:,2))
%     if GPS_EKF(i,3)~=4
%         text(gps_raw(i,1),gps_raw(i,2),num2str(GPS_EKF(i,3)));
%     end
% end
%%

% for i=1:1:size(UsedEKF_PosAngle(:,1))
%     plot([UsedEKF_PosAngle(i,1),GPS_EKF(i,1)],[UsedEKF_PosAngle(i,2),GPS_EKF(i,2)],'-c');
% end

% for i=1:1:size(UsedEKF_PosAngle(:,1))
%     plot([GPS_EKF(i,1),GPS_EKF(i,1)+expectOffset*cos(GPS_EKF(i,3))],[GPS_EKF(i,2),GPS_EKF(i,2)+expectOffset*sin(GPS_EKF(i,3))],'-c');
% end

grid on;
axis equal;
legend(legend_m);
