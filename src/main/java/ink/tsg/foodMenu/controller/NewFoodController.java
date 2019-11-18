package ink.tsg.foodMenu.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
		String newFoodImg = "file/newFoodImg/"+result;
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
	
	
}

