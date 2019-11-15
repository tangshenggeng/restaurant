package ink.tsg.feedBack.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.feedBack.beans.FeedBackSort;
import ink.tsg.feedBack.service.FeedBackSortService;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-14
 */
@Controller
@RequestMapping("/feedBackSort")
public class FeedBackSortController {
	
	@Autowired
	private  FeedBackSortService feedBSortService;
	
	
	/**
	 * 通过id得到
	 * */
	@RequestMapping(value="/getSortName",method=RequestMethod.GET)
	@ResponseBody
	public Msg getSortNameById(@RequestParam("id") Integer id) {
		FeedBackSort sort = feedBSortService.selectById(id);
		return Msg.success().add("sortName", sort.getSortName());
	}
	/**
	 * 得到所有的反馈分类信息
	 * */
	@RequestMapping(value="/getAll",method=RequestMethod.GET)
	@ResponseBody
	public List<FeedBackSort> getAll() {
		EntityWrapper<FeedBackSort> wrapper = new EntityWrapper<>();
		wrapper.eq("isdel", 1);
		List<FeedBackSort> selectList = feedBSortService.selectList(wrapper);
		return selectList; 
	}
	
}

