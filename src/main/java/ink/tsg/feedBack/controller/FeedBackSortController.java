package ink.tsg.feedBack.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ink.tsg.feedBack.beans.FeedBackSort;
import ink.tsg.feedBack.service.FeedBackSortService;

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
	
	@RequestMapping(value="/getAll",method=RequestMethod.GET)
	@ResponseBody
	public List<FeedBackSort> getAll() {
		List<FeedBackSort> selectList = feedBSortService.selectList(null);
		return selectList; 
	}
	
}

