package ink.tsg.appointment.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.appointment.beans.Appointment;
import ink.tsg.appointment.service.AppointmentService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-17
 */
@Controller
@RequestMapping("/appointment")
public class AppointmentController {

	@Autowired
	private AppointmentService appService;
	
	/**
	 * 得到所有有效的预约
	 * @return 
	 * */
	@RequestMapping(value="/getAllValidAppoint",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAllValidAppoint(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		String name = (String) map.get("name");
		String phone = (String) map.get("phone");
		String num = (String) map.get("num");
		String date = (String) map.get("date");
		EntityWrapper<Appointment> wrapper = new EntityWrapper<>();
		if(!name.equals("")) {
			wrapper.like("cust_name", name);
		}
		if(!phone.equals("")) {
			wrapper.eq("cust_phone", phone);
		}
		if(!num.equals("0")) {
			wrapper.eq("cust_num", num);
		}
		if(date.equals("now")) {
			Date nowDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String nowTime = sdf.format(nowDate);
			wrapper.eq("appointment_date", nowTime);
		}
		wrapper.eq("is_arrival", 200);
		Page<Map<String, Object>> mapsPage = appService.selectMapsPage(new Page<Appointment>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有待解决的留言");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 添加预约
	 * */
	@RequestMapping(value="/addAppointment",method=RequestMethod.POST)
	@ResponseBody
	public Msg addAppointment(Appointment app) {
		boolean b = appService.insert(app);
		if(b) {
			return Msg.success().add("msg", "预约成功！");
		}
		return Msg.fail().add("msg","预约失败！您可以打电话预约~，也希望您能反馈给我们~");
	}
	
	//=========页面跳转==========
	//去往有效预约页面
	@RequestMapping(value="/toValidAppointPage",method=RequestMethod.GET)
	public String toValidAppointPage() {
		return "/appointment/valid-appoint";
	}
	
}

