package ink.tsg.feedBack.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.feedBack.beans.FeedBack;
import ink.tsg.feedBack.beans.FeedBackSort;
import ink.tsg.feedBack.service.FeedBackService;
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
	private  FeedBackSortService feedBSortService;//反馈分类
	
	@Autowired
	private FeedBackService feedBackService;
	
	/**
	 * 添加分类
	 * */
	@RequestMapping(value="/addSort",method=RequestMethod.GET)
	@ResponseBody
	public Msg addSort(@RequestParam("sortName") String sortName) {
		FeedBackSort entity = new FeedBackSort();
		entity.setSortName(sortName);
		entity.setIsdel(1);
		boolean b = feedBSortService.insert(entity);
		if(b) {
			return Msg.success().add("msg", "添加成功！");
		}
		return Msg.fail().add("msg", "添加失败！");
	}
	
	/**
	 * 修改名称
	 * */
	@RequestMapping(value="/changeName",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeName(@RequestParam("id")Integer id,
			@RequestParam("newName")String name) {
		FeedBackSort backSort = new FeedBackSort();
		backSort.setFeedbackSortId(id);
		backSort.setSortName(name);
		boolean b = feedBSortService.updateById(backSort);
		if(b) {
			return Msg.success().add("msg", "修改成功！");
		}
		return Msg.fail().add("msg", "修改失败！");
	}
	
	/**
	 * 删除分类
	 * */
	@RequestMapping(value="/delFeedSort",method=RequestMethod.GET)
	@ResponseBody
	public Msg delFeedSort(@RequestParam("id")Integer id) {
		EntityWrapper<FeedBack> feedBackWra = new EntityWrapper<>();
		feedBackWra.eq("feedback_sort_id",id);
		int count = feedBackService.selectCount(feedBackWra);
		if(count != 0) {
			return Msg.fail().add("msg", "该分类下有反馈内容，不可删除！");
		}
		FeedBackSort backSort = new FeedBackSort();
		backSort.setFeedbackSortId(id);
		backSort.setIsdel(0);
		boolean b = feedBSortService.updateById(backSort);
		if(b) {
			return Msg.success().add("msg", "删除成功！");
		}
		return Msg.fail().add("msg", "删除失败！");
	}
	
	/**
	 * 得到所有的分类，CRUD用
	 * @return 
	 * */
	@RequestMapping(value="/getFeedSortList",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFeedSortList(@RequestParam("page")Integer page,
			@RequestParam("limit")Integer limit) {
		EntityWrapper<FeedBackSort> wrapper = new EntityWrapper<>();
		wrapper.eq("isdel", 1);
		Page<Map<String, Object>> mapsPage = feedBSortService.selectMapsPage(new Page<FeedBackSort>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有优惠卷信息");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
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

