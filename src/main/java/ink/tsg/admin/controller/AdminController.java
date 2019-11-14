package ink.tsg.admin.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/**
	 * 修改密码
	 * */
	@RequestMapping(value="/modifyPwd",method=RequestMethod.POST)
	@ResponseBody
	public Msg modifyPwd(@RequestParam("oldPwd")String oldPwd,@RequestParam("newPwd")String newPwd,@RequestParam("adminId")Integer id) {
		Admin selectById = adminService.selectById(id);
		if(!selectById.getAdminPassword().equals(oldPwd)) {
			return Msg.fail().add("msg", "旧密码错误！修改失败！");
		}
		Admin entity = new Admin();
		entity.setAdminId(id);
		entity.setAdminPassword(newPwd);
		boolean b = adminService.updateById(entity);
		if(b) {
			return Msg.success().add("msg", "修改成功！请重新登录！").add("path", "/admin/loginOut");
		}
		return Msg.fail().add("msg", "修改失败！");
	}
	
	/**
	 * 修改头像
	 * */
	@RequestMapping(value="/modifyHeader",method=RequestMethod.POST)
	@ResponseBody
	public Msg modifyHeader(@RequestParam("adminHead")String header,@RequestParam("adminId") Integer id) {
		Admin entity = new Admin();
		entity.setAdminId(id);
		entity.setAdminHead("/file/header/" + header);
		boolean b = adminService.updateById(entity);
		if (b) {
			return Msg.success().add("msg", "修改成功！").add("headerImg", entity.getAdminHead());
		}
		return Msg.fail().add("msg", "修改失败！");
		 
		
		
	}
	
	/**
	 * 登录
	 * */
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
		req.getSession().setAttribute("admin", one.getAdminName());
		req.getSession().setAttribute("adminHeader", one.getAdminHead());
		req.getSession().setAttribute("adminId", one.getAdminId());
		return "/index";
	}
	
	//=============页面跳转===============
	/**
	 * 去往编辑资料界面
	 * */
	@RequestMapping(value="/editAdminInfo",method=RequestMethod.GET)
	public String editAdminInfo() {
		return "/admin/editAdminInfo";
	}
	/**
	 * 去往首页
	 * */
	@RequestMapping(value="toIndex",method=RequestMethod.GET)
	public String toIndex() {
		return "/index";
	}
	
	/**
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/admin/toLogin";
	}
	
	/**
	 * 去往登录页面
	 * */
	@RequestMapping(value="/toLogin",method=RequestMethod.GET)
	public String toLogin() {
		return "admin-login";
	}

}

