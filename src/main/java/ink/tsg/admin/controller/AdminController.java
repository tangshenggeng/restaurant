package ink.tsg.admin.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.admin.beans.Admin;
import ink.tsg.admin.service.AdminService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-12
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/loginInto",method=RequestMethod.POST)
	public String loginInto(Admin admin,HttpServletRequest req) {
		EntityWrapper<Admin> wrapper = new EntityWrapper<>();
		wrapper.eq("admin_name", admin.getAdminName());
		wrapper.eq("admin_password", admin.getAdminPassword());
		Admin one = adminService.selectOne(wrapper);
		if(one==null) {
			req.getSession().setAttribute("msg", "用户名不存在或密码错误！");
			return  "redirect:/admin/toLogin";
		}
		return "/index";
	}
	
	
	
	
	
	
	//=============页面跳转===============
	@RequestMapping(value="/toLogin",method=RequestMethod.GET)
	public String toLogin() {
		return "admin-login";
	}

}

