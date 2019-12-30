#!/usr/bin/env python
# license removed for brevity
# rostopic pub -r 2  -v /local_path_reprogramming can_msgs/SLPRcstraint  3 3 7 7 1 3.5 1
import rospy
from can_msgs.msg import Float64Vector
# from std_msgs.msg import Int8

def talker():
    pub = rospy.Publisher('/ActionManagerPlug_1/SteerAndSpeedCmd_716', Float64Vector, queue_size=10)
    rospy.init_node('Test_1', anonymous=True)
    rate = rospy.Rate(20)   # 10hz
    step=1
    while not rospy.is_shutdown():

        test_message=Float64Vector()
        test_message.float_vector.append(0)#speed
        test_message.float_vector.append(0)#steer
        test_message.float_vector.append(0)#
        test_message.float_vector.append(0)#1
        test_message.float_vector.append(0)#1
        test_message.float_vector.append(0)#0
        test_message.float_vector.append(0)#1
        pub.publish(test_message)
        # if step==1 :
        #     step=0
        # else:
        #     step=1

        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
