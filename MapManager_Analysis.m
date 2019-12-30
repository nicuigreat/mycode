% start_index=size(ataCollectionForGuo_27_AllData,1)-10000;
Position_Index=MapManager(:,3);
lateral_error=MapManager(:,6);
road_point_orientation=MapManager(:,7);
vehicle_orientation=MapManager(:,28);
road_point_curvature=MapManager(:,23);
vehicle_curvature=MapManager(:,39);
vehicle_curvature_steer=MapManager(:,40);

preview_point=[MapManager(:,4:5)];
lateral_point=[MapManager(:,32:33)];
vehicle_pos=[MapManager(:,26:28)];
yaw=vehicle_pos(:,3);
time_second=MapManager(:,2)-MapManager(1,2);
time_div=1; % or 60
expectOffset=2.1;% 前轮到后�??

%% value-time

figure(119);hold on;legend_m={};
legend_index=1;
% plot(road_point_curvature*5,'k');
% legend_m{legend_index}='road point curvature';legend_index=legend_index+1;
d_curvature=MapManager(:,end);
% plot(MapManager(:,end)*10,'k');
% legend_m{legend_index}='df road point curvature';legend_index=legend_index+1;

% plot(vehicle_curvature,'b');
% legend_m{legend_index}='vehicle curvature';legend_index=legend_index+1;
% 
% plot(vehicle_curvature_steer,'k');
% legend_m{legend_index}='vehicle curvature steer';legend_index=legend_index+1;
plot(lateral_error,'r');
legend_m{legend_index}='lateral error';legend_index=legend_index+1;


% plot(filter_through2(diff(lateral_error),20)*10,'g');
% legend_m{legend_index}='di lateral error';legend_index=legend_index+1;
% d_lateral_error=[0;diff(lateral_error)];
% plot(filter_through(d_lateral_error,20),'g');
% legend_m{legend_index}='di lateral error';legend_index=legend_index+1;


% plot((road_point_orientation-vehicle_orientation)*180/pi,'k');
% legend_m{legend_index}='orientation error';legend_index=legend_index+1;


legend(legend_m);

% figure(116);hold on;
% legend_m={};
% legend_index=1;
% 
% % plot(time_second/time_div,MapManager(:,19)/10,'-sb','MarkerSize',4);% StartTrigger
% % legend_m{legend_index}='what?';legend_index=legend_index+1;
% % 
% % plot(time_second/time_div,MapManager(:,7)*180/pi,'-sk','MarkerSize',4);% StartTrigger
% % legend_m{legend_index}='road point orientation';legend_index=legend_index+1;
% % 
% % plot(time_second/time_div,MapManager(:,28)*180/pi,'-sg','MarkerSize',4);% StartTrigger
% % legend_m{legend_index}='vehicle orientation';legend_index=legend_index+1;
% 
% plot(time_second/time_div,MapManager(:,14),'-sg','MarkerSize',4);% StartTrigger
% legend_m{legend_index}='diff angle';legend_index=legend_index+1;
% % plot(time_second/time_div,cal_wheel_steering,'-*k','MarkerSize',4);% StartTrigger
% % legend_m{legend_index}='cal wheel steering';legend_index=legend_index+1;
% grid on;
% legend(legend_m);
% xlabel('time: s');



%% x-y
    
center_p=(vehicle_pos(:,1:2)+preview_point)/2;
line_orientation=atan2(vehicle_pos(:,2)-preview_point(:,2),vehicle_pos(:,1)-preview_point(:,1));
line_orientation=line_orientation+pi/2;
center_line=[center_p,line_orientation];

rear_wheel=[MapManager(:,26)-expectOffset*cos(yaw(:)),MapManager(:,27)-expectOffset*sin(yaw(:))];
rear_orientaion=yaw+pi/2;
rear_line=[rear_wheel,rear_orientaion];
cir_c=[];
for i=1:size(rear_line,1)
    [p,is]=cross_point_between_line_and_line(center_line(i,:),rear_line(i,:));
    cir_c=[cir_c;p];
end

cal_wheel_steering=atan2(rear_wheel(:,2)-cir_c(:,2),rear_wheel(:,1)-cir_c(:,1))-atan2(vehicle_pos(:,2)-cir_c(:,2),vehicle_pos(:,1)-cir_c(:,1));
% 
% left_length=abs([vehicle_pos(:,1)-cir_c(:,1)]+sqrt(-1)*([vehicle_pos(:,2)-cir_c(:,2)]));
% right_length=abs([preview_point(:,1)-cir_c(:,1)]+sqrt(-1)*([preview_point(:,2)-cir_c(:,2)]));
% bili=left_length./right_length;
figure(123);hold on;
legend_m={};
legend_index=1;
axis equal;

% plot(road(:,2),road(:,3),'-ok','MarkerSize',4);% 
% legend_m{legend_index}='road';legend_index=legend_index+1;

% plot(rea(:,1),rea(:,2),'-sg','MarkerSize',4);% 
% legend_m{legend_index}='rea';legend_index=legend_index+1;
plot(MapManager(:,32),MapManager(:,33),'-*b','MarkerSize',4);%
legend_m{legend_index}='map in mapmanager';legend_index=legend_index+1;

% plot(center_line(:,1),center_line(:,2),'-sr','MarkerSize',4);%
% legend_m{legend_index}='center line';legend_index=legend_index+1;

plot(vehicle_pos(:,1),vehicle_pos(:,2),'-sg','MarkerSize',4);%
legend_m{legend_index}='vehicle pos now';legend_index=legend_index+1;

% plot(preview_point(:,1),preview_point(:,2),'-sc','MarkerSize',4);%
% legend_m{legend_index}='preview point now';legend_index=legend_index+1;

% for i=1:1:size(MapManager,1)
%     text(MapManager(i,32),MapManager(i,33),num2str(Position_Index(i)));
% end
for i=1:10:size(MapManager,1)
%     text(road(i,1),road(i,2),num2str(road(i,3)*180/pi));
%     plot([MapManager(i,26),MapManager(i,26)+expectOffset*cos(yaw(i))],[MapManager(i,27),MapManager(i,27)+expectOffset*sin(yaw(i))],'-rs','LineWidth',1.5);
%     plot([vehicle_pos(i,1);cir_c(i,1)],[vehicle_pos(i,2);cir_c(i,2)],'-*k');
%     plot([preview_point(i,1);vehicle_pos(i,1)],[preview_point(i,2);vehicle_pos(i,2)],'-*k');

%     plot([MapManager(i,4);MapManager(i,26)],[MapManager(i,5);MapManager(i,27)],'r');
%     plot([lateral_point(i,1);MapManager(i,26)],[lateral_point(i,2);MapManager(i,27)],'y');
%     text(vehicle_pos(i,1),vehicle_pos(i,2),num2str(lateral_error(i)),'FontSize',16);
end

% for i=1:1:size(road,1)
% 
%     text(road(i,2),road(i,3),num2str(road(i,1)));
% %     text(road(i,1)+0.1,road(i,2),num2str(road(i,3)),'Color','red');
% end

 legend(legend_m);
grid on;
function out=filter_through(in,thr )    % 默认thr为奇数
   out=[];
    for i=1:size(in,1)
        if i<(thr+1)/2
            out(i)=in(i);
        elseif i>size(in,1)-(thr+1)/2
            out(i)=in(i);
        else
            out(i)=mean(in(i-(thr-1)/2:i+(thr-1)/2));
        end
            
    end
end
function out=filter_through2(in,thr )    % 默认thr为奇数
   out=[];
    for i=1:size(in,1)
        if i>size(in,1)-thr
            out(i)=in(i);
        else
            out(i)=mean(in(i:i+thr));
        end
            
    end
end

