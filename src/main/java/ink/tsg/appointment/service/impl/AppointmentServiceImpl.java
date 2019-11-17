package ink.tsg.appointment.service.impl;

import ink.tsg.appointment.beans.Appointment;
import ink.tsg.appointment.mapper.AppointmentMapper;
import ink.tsg.appointment.service.AppointmentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-17
 */
@Service
public class AppointmentServiceImpl extends ServiceImpl<AppointmentMapper, Appointment> implements AppointmentService {

}
