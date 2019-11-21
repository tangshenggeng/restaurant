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

import ink.tsg.foodMenu.beans.FoodMenus;
import ink.tsg.foodMenu.beans.NewFood;
import ink.tsg.foodMenu.service.FoodMenusService;
import ink.tsg.untils.Msg;
import ink.tsg.untils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-19
 */
@Controller
@RequestMapping("/foodMenus")
public class FoodMenusController {
	/**
	 * 文件保存的路径
	 */
	public static final String SAVE_PATH = "D:\\restaurantTemp\\menus";
	
	@Autowired
	private FoodMenusService foodMenusSer;
	
	/**
	 * 菜单展示
	 * @return 
	 * */
	@RequestMapping(value="/getAllFoodMenus",method=RequestMethod.GET)
	@ResponseBody
	public List<FoodMenus> getAllShowNewFppd() {
		EntityWrapper<FoodMenus> wrapper = new EntityWrapper<>();
		wrapper.eq("is_show", 100);
		List<FoodMenus> list = foodMenusSer.selectList(wrapper);
		return list;
	}
	
	
	/**
	 * 修改新品的信息
	 * */
	@RequestMapping(value="/changeFoodMenusInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg changeNewFoodInfo(FoodMenus foodMenus) {
		boolean b = foodMenusSer.updateById(foodMenus);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 删除
	 * */
	@RequestMapping(value="/delFoodMenus",method=RequestMethod.GET)
	@ResponseBody
	public Msg delNewFood(@RequestParam("id")Integer id) {
		boolean b = foodMenusSer.deleteById(id);
		if(b) {
			return Msg.success().add("msg", "删除成功！");
		}
		return Msg.fail().add("msg","删除失败！");
	}
	
	/**
	 * 展示
	 * */
	@RequestMapping(value="/changeFoodMenusShow",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeNewFoodShow(@RequestParam("id")Integer id,
			@RequestParam("isShow")Integer isShow) {
		
			EntityWrapper<FoodMenus> wrapper = new EntityWrapper<>();
			wrapper.eq("is_show", isShow);
			int count = foodMenusSer.selectCount(wrapper);
			if(count > 7) {
				return Msg.fail().add("msg","为了用户体验，最多只能展示8个新品！");
			}
			FoodMenus newFood = new FoodMenus();
			newFood.setMenuId(id);
			newFood.setIsShow(isShow);
			boolean b = foodMenusSer.updateById(newFood);
			if(b) {
				return Msg.success().add("msg", "修改成功！");
			}
			return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 得到所有菜单
	 * @return 
	 * */
	@RequestMapping(value="/getFoodMenusList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getNewFoodList(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		String isShow = (String) map.get("isShow");
		String priceMin = (String) map.get("priceMin");
		String priceMax = (String) map.get("priceMax");
		String foodName = (String) map.get("foodName");
		String foodMaterial = (String) map.get("foodMaterial");
		EntityWrapper<FoodMenus> wrapper = new EntityWrapper<>();
		if(!isShow.equals("0")) {
			int show = Integer.parseInt(isShow);
			wrapper.eq("is_show", show);
		}
		if(!foodName.equals("")) {
			wrapper.like("food_name", foodName);
		}
		if(!foodMaterial.equals("")) {
			wrapper.like("food_material", foodMaterial);
		}
		if(!priceMin.equals("") && !priceMax.equals("")) {
			double min=Double.parseDouble(priceMin);
			double max=Double.parseDouble(priceMax);
			wrapper.between("new_price", min, max);
		}
		Page<Map<String, Object>> mapsPage = foodMenusSer.selectMapsPage(new Page<FoodMenus>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","菜单管理");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 添加菜单
	 * */
	@RequestMapping(value="/addFoodMenus",method=RequestMethod.POST)
	@ResponseBody
	public Msg addFoodMenus(FoodMenus foodMenus) {
		foodMenus.setIsShow(200);
		boolean b = foodMenusSer.insert(foodMenus);
		if(b) {
			return Msg.success().add("msg", "添加成功！");
		}
		return Msg.fail().add("msg","添加失败！");
	}
	
	/**
	 * 图片上传
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
		String newFoodImg = "/file/menus/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", newFoodImg);
		return resultMap;
	}
	
	//=========页面跳转=============
	//去往添加菜单页面
	@RequestMapping(value="/toAddFoodMenusPage",method=RequestMethod.GET)
	public String toAddFoodMenusPage() {
		return "/food/add-menus-food";
	}
	//去往展示菜单页面
	@RequestMapping(value="/toFoodMenusListPage",method=RequestMethod.GET)
	public String toFoodMenusListPage() {
		return "/food/food-menus-list";
	}
	
}

