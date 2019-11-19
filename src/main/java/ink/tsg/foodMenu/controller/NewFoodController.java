package ink.tsg.foodMenu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.foodMenu.beans.NewFood;
import ink.tsg.foodMenu.service.NewFoodService;
import ink.tsg.untils.Msg;
import ink.tsg.untils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-18
 */
@Controller
@RequestMapping("/newFood")
public class NewFoodController {
	/**
	 * 文件保存的路径
	 */
	public static final String SAVE_PATH = "D:\\restaurantTemp\\newFoodImg";
	
	@Autowired
	private NewFoodService newFoodService;
	
	/**
	 * 新品展示
	 * @return 
	 * */
	@RequestMapping(value="/getAllShowNewFppd",method=RequestMethod.GET)
	@ResponseBody
	public List<NewFood> getAllShowNewFppd() {
		EntityWrapper<NewFood> wrapper = new EntityWrapper<>();
		wrapper.eq("is_show", 100);
		List<NewFood> list = newFoodService.selectList(wrapper);
		return list;
	}
	
	/**
	 * 删除
	 * */
	@RequestMapping(value="/delNewFood",method=RequestMethod.GET)
	@ResponseBody
	public Msg delNewFood(@RequestParam("id")Integer id) {
		boolean b = newFoodService.deleteById(id);
		if(b) {
			return Msg.success().add("msg", "删除成功！");
		}
		return Msg.fail().add("msg","删除失败！");
	}
	
	/**
	 * 修改新品的信息
	 * */
	@RequestMapping(value="/changeNewFoodInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg changeNewFoodInfo(NewFood newFood) {
		boolean b = newFoodService.updateById(newFood);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 展示
	 * */
	@RequestMapping(value="/changeNewFoodShow",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeNewFoodShow(@RequestParam("id")Integer id) {
		EntityWrapper<NewFood> wrapper = new EntityWrapper<>();
		wrapper.eq("is_show", 100);
		int count = newFoodService.selectCount(wrapper);
		if(count > 5) {
			return Msg.fail().add("msg","为了用户体验，最多只能展示6个新品！");
		}
		NewFood newFood = new NewFood();
		newFood.setNewFoodId(id);
		newFood.setIsShow(100);
		boolean b = newFoodService.updateById(newFood);
		if(b) {
			return Msg.success().add("msg", "展示成功！");
		}
		return Msg.fail().add("msg","展示失败！");
	}
	
	/**
	 * 得到所有上新美食
	 * @return 
	 * */
	@RequestMapping(value="/getNewFoodList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getNewFoodList(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		String isShow = (String) map.get("isShow");
		String priceMin = (String) map.get("priceMin");
		String priceMax = (String) map.get("priceMax");
		String foodName = (String) map.get("foodName");
		String foodDescribe = (String) map.get("foodDescribe");
		EntityWrapper<NewFood> wrapper = new EntityWrapper<>();
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
		if(!priceMin.equals("") && !priceMax.equals("")) {
			double min=Double.parseDouble(priceMin);
			double max=Double.parseDouble(priceMax);
			wrapper.between("food_price", min, max);
		}
		Page<Map<String, Object>> mapsPage = newFoodService.selectMapsPage(new Page<NewFood>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","上新美食");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 上新
	 * */
	@RequestMapping(value="/addNewFood",method=RequestMethod.POST)
	@ResponseBody
	public Msg addNewFood(NewFood newFood) {
		newFood.setIsShow(200);
		boolean b = newFoodService.insert(newFood);
		if(b) {
			return Msg.success().add("msg", "上新成功！");
		}
		return Msg.fail().add("msg","上新失败！");
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
		String newFoodImg = "/file/newFoodImg/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", newFoodImg);
		return resultMap;
	}
	
	//=======页面跳转=======
	@RequestMapping(value="/toAddNewPage",method=RequestMethod.GET)
	public String toAddNewPage() {
		return "/food/add-new-food";
	}
	@RequestMapping(value="/toNewFoodListPage",method=RequestMethod.GET)
	public String toNewFoodListPage() {
		return "/food/new-food-list";
	}
	
	
}

