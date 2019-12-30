% hold on
% plot([0;diff(GpsEKF(:,5))*180/pi]);
% plot(GpsEKF(:,25)*180/pi);
% plot(GpsEKF(:,end)*180/pi);
% legend({'merge','Imu','gps'});

%%
figure(1);
hold on;
plot(test1(:,1))
plot(test1(:,3))
plot(test1(:,15))
legend({'obv input','before','after'});

figure(2);
hold on;
plot(test1(:,2))
plot(test1(:,4))
plot(test1(:,16))
legend({'obv input','before','after'});

figure(3);
hold on;
plot(test1(:,5)*180/pi)
plot(test1(:,17)*180/pi)
plot(test1(:,5)*180/pi-test1(:,17)*180/pi)
legend({'before','after','diff'});

P_before=[test1(:,6),test1(:,7),test1(:,8),test1(:,9),test1(:,10),test1(:,11),test1(:,12),test1(:,13),test1(:,14)];
P_after=[test1(:,9),test1(:,10),test1(:,11),test1(:,12),test1(:,13),test1(:,14),test1(:,15),test1(:,16),test1(:,17)];





for i=1:size(P_before,1)
    
        if i==405
            qqq=1;
        end
%     Lu_Matrix G(2, 3);
% 	G(0, 0) = 1;
% 	G(0, 1) = 0;
% 	G(0, 2) = 0;
% 	G(1, 0) = 0;
% 	G(1, 1) = 1;
% 	G(1, 2) = 0;
% 	Lu_Matrix Zpre(2, 1);
% 	Zpre(0) = Xpre(0);
% 	Zpre(1) = Xpre(1);
% 	Lu_Matrix Zobv(2, 1);
% 	Zobv(0) = x;
% 	Zobv(1) = y;
% 	Lu_Matrix K_gain(Xpre.RowNum(), Xpre.ColNum());
% 
% 	Zobv -= Zpre;
% 	if (Zobv(0) * Zobv(0) + Zobv(1) * Zobv(1) < 0.00000001)
% 		return;
% 
% 	K_gain = P_pre * Tp(G) * Inv(G * P_pre * Tp(G) + R0);
% 	Xpre = Xpre + K_gain * (Zobv);
% 	P_pre = P_pre - K_gain * G * P_pre
    R0=[0.0009,0;0,0.0009];
    P_pre=[test1(i,(6)),test1(i,(7)),test1(i,(8));test1(i,(9)),test1(i,(10)),test1(i,(11));test1(i,(12)),test1(i,(13)),test1(i,(14))];
    G=[ 1 0 0;0,1,0];
    Zpre=[test1(i,3);test1(i,4)];
    Xpre=[test1(i,3);test1(i,4);test1(i,5)];
    Zobv=[test1(i,(1));test1(i,(2))];
    Zobv =Zobv- Zpre;
    K_gain = P_pre * G' * (G * P_pre * G' + R0)^(-1);
    shiqiang=Xpre;
    Xpre = Xpre + K_gain * (Zobv);
    
    gg=Xpre(3)-shiqiang(3);
    hsid=1;
%     P_pre = P_pre - K_gain * G * P_pre;



end