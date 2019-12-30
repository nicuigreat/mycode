mil_gps=abs( init_gps(2:end,1)-init_gps(1:end-1,1)+sqrt(-1).*( init_gps(2:end,2)-init_gps(1:end-1,2)           )         );
speed_gps=mil_gps/0.05;


%%中值滤波
speed_after_filed=[];
field=13;
for i=1:size(speed_gps,1)
    if i<7
        speed_after_filed(i)=speed_gps(i);
    elseif i>size(speed_gps,1)-7
        speed_after_filed(i)=speed_gps(i);
    else
        speed_after_filed(i)=mean(speed_gps(i-6:i+6));
    end
end
x_v=1:size(speed_after_filed,2);
x_v=x_v;
x_v=x_v*2.611817244933013;
plot(x_v,speed_after_filed);
hold on;
% plot(speed_gps);

% plot(speed*1.05);
plot(ss(:,2)*1.05);
%%


figure(2)
plot(ss(:,1));
hold on;
% plot(ss(:,2));
% hold on;
plot(ss(:,3));
% hold on;
% plot(ss(:,4));
% hold on;
% plot(ss(:,5));
% hold on;
legend({'lf','rf'});