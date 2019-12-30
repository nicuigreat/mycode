%% 求曲率 三个点分别是A B C。
% A=input('请输入第一个坐标点的[x1,y1]：');
% 
% B=input('请输入第二个坐标点的[x2,y2]：');
% 
% C=input('请输入第三个坐标点的[x3,y3]：');
A=AA.Position;
B=BB.Position;
C=CC.Position;

plot([A(1) B(1)],[A(2) B(2)],'b','linewidth',2);hold on

plot([A(1) C(1)],[A(2) C(2)],'b','linewidth',2);

plot([C(1) B(1)],[C(2) B(2)],'b','linewidth',2);

judge1=(B(1)-C(1))*(B(2)-A(2))-(B(1)-A(1))*(B(2)-C(2));

judge2=B(2)-A(2);

I1=0.5*(C(2)-A(2))*(B(2)-C(2))*(B(2)-A(2));

I2=0.5*(A(1)^2-B(1)^2)*(B(2)-C(2));

I3=0.5*(B(1)^2-C(1)^2)*(B(2)-A(2));

if(judge1==0)

    fprintf('输入的三点构成一条直线，不能画一个圆。');

else

    x0=(I1+I2+I3)/judge1;

    if(judge2==0)

        y0=-(B(1)-C(1))*(x0-0.5*(B(1)+C(1)))/(B(2)-C(2))+0.5*(B(2)+C(2));

    else

        y0=-(B(1)-A(1))*(x0-0.5*(B(1)+A(1)))/(B(2)-A(2))+0.5*(B(2)+A(2));

    end

    r=sqrt((x0-A(1))^2+(y0-A(2))^2);

    theta=0:0.01:2*pi;

    fprintf('\n圆的圆心是（%f,%f）\n',x0,y0);

    fprintf('圆的半径是%f\n',r);

    x=x0+r*cos(theta);

    y=y0+r*sin(theta);

    plot([x0,A(1)],[y0,A(2)],'g');

    plot([x0,B(1)],[y0,B(2)],'g');

    plot([x0,C(1)],[y0,C(2)],'g');

    plot(x,y,'r','linewidth',2);

    grid on

    axis equal

end