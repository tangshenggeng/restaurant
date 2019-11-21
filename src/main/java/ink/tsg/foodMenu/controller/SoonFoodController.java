package ink.tsg.foodMenu.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.foodMenu.beans.SoonFood;
import ink.tsg.foodMenu.service.SoonFoodService;
import ink.tsg.untils.Msg;
import ink.tsg.untils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-20
 */
@Controller
@RequestMapping("/soonFood")
public class SoonFoodController {
	/**
	 * 文件保存的路径
	 */
	public static final String SAVE_PATH = "D:\\restaurantTemp\\soonFoodImg";
	
	@Autowired
	private SoonFoodService soonFoodSer;
	
	/**
	 * 阅读
	 * */
	@RequestMapping(value="/reading/{id}")
	public String reading(@PathVariable Integer id,HttpServletRequest req) {
		SoonFood soon = soonFoodSer.selectById(id);
		Date upTime = soon.getUpTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(upTime);
        soon.setFormTime(format);
		req.setAttribute("soonFoods", soon);
		return "forward:/restaurant_page/reading.jsp";
	}
	
	/**
	 * 前台展示
	 * @return 
	 * */
	@RequestMapping(value="/getAllSoonFoods",method=RequestMethod.GET)
	@ResponseBody
	public List<SoonFood> getAllSoonFoods() {
		EntityWrapper<SoonFood> wrapper = new EntityWrapper<>();
		wrapper.eq("is_show", 100);
		List<SoonFood> list = soonFoodSer.selectList(wrapper);
		for (SoonFood soonFood : list) {
			Date upTime = soonFood.getUpTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String format = sdf.format(upTime);
	        soonFood.setFormTime(format);
		}
		return list;
	}
	/**
	 * 删除
	 * */
	@RequestMapping(value="/delSoonFoodByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delSoonFoodByIds(@RequestBody String list) {
		ArrayList<Integer> idList = new ArrayList<>();
		String[] split = list.split(",");
		for (String string : split) {
			int id = Integer.parseInt(string);
			idList.add(id);
		}
		boolean b = soonFoodSer.deleteBatchIds(idList);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 修改新品的信息
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/changeSoonFoodInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg changeNewFoodInfo(SoonFood soonFood) throws ParseException{
		String formtime = soonFood.getFormTime();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date changeTime = sf.parse(formtime);
		soonFood.setUpTime(changeTime);
		boolean b = soonFoodSer.updateById(soonFood);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	/**
	 * 修改博文
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/changeFoodBlogInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg changeFoodBlogInfo(SoonFood soonFood) throws ParseException{
		boolean b = soonFoodSer.updateById(soonFood);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	
	/**
	 * 展示
	 * */
	@RequestMapping(value="/changeSoonFoodShow",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeNewFoodShow(@RequestParam("id")Integer id,
			@RequestParam("isShow")Integer isShow) {
			EntityWrapper<SoonFood> wrapper = new EntityWrapper<>();
			wrapper.eq("is_show", 100);
			int count = soonFoodSer.selectCount(wrapper);
			if(count > 2) {
				return Msg.fail().add("msg","为了用户体验，最多只能展示3个推新！");
			}
			SoonFood soonFood = new SoonFood();
			soonFood.setSoonId(id);
			soonFood.setIsShow(isShow);
			boolean b = soonFoodSer.updateById(soonFood);
			if(b) {
				return Msg.success().add("msg", "修改成功！");
			}
			return Msg.fail().add("msg","修改失败！");
	}
	
	
	/**
	 * 得到所有上新美食
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getSoonFoodList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSoonFoodList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		String isShow = (String) map.get("isShow");
		String startTime = (String) map.get("startTime");
		String endTime = (String) map.get("endTime");
		String foodName = (String) map.get("foodName");
		String foodDescribe = (String) map.get("foodDescribe");
		EntityWrapper<SoonFood> wrapper = new EntityWrapper<>();
		if(!isShow.equals("0")) {
			int show = Integer.parseInt(isShow);
			wrapper.eq("is_show", show);
		}
		if(!foodName.equals("")) {
			wrapper.like("food_name", foodName);
		}
		if(!foodDescribe.equals("")) {
			wrapper.like("food_describe", foodDescribe);
		}
		if(!startTime.equals("") && !endTime.equals("")) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = sf.parse(startTime);
			Date end = sf.parse(endTime);
			wrapper.between("up_time", start, end);
		}
		Page<Map<String, Object>> mapsPage = soonFoodSer.selectMapsPage(new Page<SoonFood>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","上新美食");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 推新
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/addSoonFood",method=RequestMethod.POST)
	@ResponseBody
	public Msg addNewFood(SoonFood soonFood) throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sf.parse(soonFood.getFormTime());
		soonFood.setUpTime(date);
		soonFood.setIsShow(200);
		boolean b = soonFoodSer.insert(soonFood);
		if(b) {
			return Msg.success().add("msg", "推新成功！");
		}
		return Msg.fail().add("msg","推新失败！");
	}
	
	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadNewFoodImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadNewFoodImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, SAVE_PATH);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String newFoodImg = "/file/soonFoodImg/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", newFoodImg);
		return resultMap;
	}
	
	//==========页面跳转==========
	//跳转到添加页面
	@RequestMapping(value="/toAddSoonPage",method=RequestMethod.GET)
	public String toAddSoonPage() {
		return "/food/add-soon-food";
	}
	//=========去往推新管理页面==============
	@RequestMapping(value="/toSoonFoodListPage",method=RequestMethod.GET)
	public String toSoonFoodListPage() {
		return "/food/soon-food-list";
	}
	
}

