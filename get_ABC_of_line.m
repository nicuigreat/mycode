function [A,B,C] = get_ABC_of_line(line)
%GET_ABC_OF_LINE ��һ����ͷ���ȷ��������ȷ����Ax+By+C=0 ��ABC
%   �˴���ʾ��ϸ˵��
    x0=line(1,1);
    y0=line(1,2);
    theta=line(1,3);
    A=sin(theta);
    B=-cos(theta);
    C=y0*cos(theta)-x0*sin(theta);
end

