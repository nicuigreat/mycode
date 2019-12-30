    can_msgs::Float64Vector control_cmd_msg;
        control_cmd_msg.float_vector.resize(7);
            // control_cmd_msg.float_vector.at(0)=1; //speed,m/s
                control_cmd_msg.float_vector.at(0)=speed_cmd; //speed,m/s
                // if(ObsDistance<15){
                            // control_cmd_msg.float_vector.at(0)=0; //speed,m/s
                        // 
                }
                    // control_cmd_msg.float_vector.at(0)=std::abs(1); //speed,m/s
                        control_cmd_msg.float_vector.at(1)=SteerCmd_lf;   //rad/s
                            control_cmd_msg.float_vector.at(2)=enable_pose_mode;    //位置模式使能位,0-1
                                control_cmd_msg.float_vector.at(3)=speed_or_pose_mode; //速度模式还是位置模式,0-1
                                    control_cmd_msg.float_vector.at(4)=speed_mode; //NDR档位    //0-2
                                        control_cmd_msg.float_vector.at(5)=steer_mode; //全八,半八等0-7;
                                            control_cmd_msg.float_vector.at(6)=pos_inc; //位置模式下位置增量    //m
                                                pub_control_cmd.publish(control_cmd_msg);

                                                    can_msgs::Float64Vector brake_and_io_cmd_msg;
                                                        brake_and_io_cmd_msg.float_vector.resize(8);
                                                            brake_and_io_cmd_msg.float_vector.at(0)=vehicle_or_wheel; //控制车轮还是整车,我们用的是整车0 是整车 1是轮子
                                                                brake_and_io_cmd_msg.float_vector.at(1)=brake_and_io_function; //制动虚拟力 0-100
                                                                    brake_and_io_cmd_msg.float_vector.at(2)=reset; //一个复位标志   位,该标志位下车辆自动驾驶有效
                                                                        brake_and_io_cmd_msg.float_vector.at(3)=in_stop;    //驻车
                                                                            brake_and_io_cmd_msg.float_vector.at(4)=ring; //喇叭
                                                                                brake_and_io_cmd_msg.float_vector.at(5)=right_light; //右灯光
                                                                                    brake_and_io_cmd_msg.float_vector.at(6)=left_light; //左灯光
                                                                                        brake_and_io_cmd_msg.float_vector.at(7)=double_light; //双闪
                                                                                            pub_brake_and_io_cmd.publish(brake_and_io_cmd_msg);

