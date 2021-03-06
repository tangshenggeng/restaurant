package ink.tsg.feedBack.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.discount.service.FeedDiscountService;
import ink.tsg.feedBack.beans.FeedBack;
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
@RequestMapping("/feedBack")
public class FeedBackController {
	
	@Autowired
	private FeedBackService feedBService;	//留言
	
	@Autowired
	private FeedBackSortService feedBSService; //留言分类
	
	/**
	 * 通过id得到反馈人信息
	 * */
	@RequestMapping(value="/getFeedBackById",method=RequestMethod.GET)
	@ResponseBody
	public Msg getFeedBackById(@RequestParam("id")Integer id) {
		FeedBack selectById = feedBService.selectById(id);
		return Msg.success().add("feedName", selectById.getFeedbackCustName())
				.add("feedEmail", selectById.getFeedbackCustEmail())
				.add("feedText",selectById.getFeedbackText()); 
	} 
	/**
	 * 删除反馈
	 * */
	@RequestMapping(value="/delFeedBack",method=RequestMethod.GET)
	@ResponseBody
	public Msg delFeedBack(@RequestParam("id")Integer id) {
		boolean b = feedBService.deleteById(id);
		if(b) {
			return Msg.success().add("msg", "删除成功！");
		}
		return Msg.fail().add("msg", "删除失败！");
	}
	/**
	 * 确认解决
	 * */
	@RequestMapping(value="/solveFeedBack",method=RequestMethod.GET)
	@ResponseBody
	public Msg solveFeedBack(@RequestParam("id")Integer id) {
		//获取当前的时间
		Date date = new Date();
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(date);
		
		FeedBack f = new FeedBack();
		f.setFeedbackId(id);
		f.setFeedIsDel(0);
		f.setSolveTime(nowTime);
		boolean b = feedBService.updateById(f);
		if(!b) {
			return Msg.fail().add("msg", "确认解决失败！");
		}
		return Msg.success().add("msg", "确认解决成功！");
	}
	
	/**
	 * 更新反馈表（给反馈加分类）
	 * */
	@RequestMapping(value="/updateFeedBack",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateFeedBack(FeedBack feedBack) {
		boolean b = feedBService.updateById(feedBack);
		if(!b) {
			return Msg.fail().add("msg", "修改失败！");
		}
		return Msg.success().add("msg", "修改成功！");
	}
	/**
	 *查询所有未解决，未分类的反馈 
	 * @return 
	 * */
	@RequestMapping(value="/getNoSolvedFeedList",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getNoSolvedFeedList(@RequestParam("page")Integer page,
			@RequestParam("limit")Integer limit,@RequestParam("solved")Integer solved) {
		
		EntityWrapper<FeedBack> wrapper = new EntityWrapper<>();
		wrapper.eq("feed_is_del", solved);
		wrapper.eq("feed_is_given", 1);//未赠送优惠卷
		Page<Map<String, Object>> feedBackPage = feedBService.selectMapsPage(new Page<FeedBack>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有待解决的留言");
		resultMap.put("total",feedBackPage.getTotal());
		resultMap.put("data",feedBackPage.getRecords());
		return resultMap;
	}
	/**
	 *查询所有已经解决，已经分类的反馈 
	 * @return 
	 * */
	@RequestMapping(value="/getAlreadySolvedFeedList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAlreadySolvedFeedList(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		
		int sortId = Integer.parseInt((String) map.get("sortId"));
		
		EntityWrapper<FeedBack> wrapper = new EntityWrapper<>();
		wrapper.eq("feed_is_del", map.get("solved"));
		if(map.get("serious")!=null) {
			wrapper.eq("feedback_serious", map.get("serious"));
		}
		if(sortId != 0) {
			wrapper.eq("feedback_sort_id", sortId);
		}
		wrapper.eq("feed_is_given", 1);
		Page<Map<String, Object>> mapsPage = feedBService.selectMapsPage(new Page<FeedBack>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有已解决的留言");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 添加反馈
	 * */
	@RequestMapping(value="/addFeedBack",method=RequestMethod.POST)
	@ResponseBody
	public Msg addFeedBack(FeedBack feedBack) {
		feedBack.setFeedbackSerious(0);
		feedBack.setFeedIsDel(1);
		feedBack.setFeedbackSortId(0);
		feedBack.setFeedIsGiven(1);
		boolean b = feedBService.insert(feedBack);
		if(!b) {
			return Msg.fail().add("msg", "反馈失败！请电话联系反馈吧！谢谢~");
		}
		return Msg.success().add("msg", "感谢你的反馈！");
	}
	//===========页面跳转================
	@RequestMapping(value="/afterSolveFB",method=RequestMethod.GET)
	public String afterSolveFB() {
		return "/feedback/after-solver-fb";
	}
}

