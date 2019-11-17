package ink.tsg.discount.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import ink.tsg.discount.beans.Discount;
import ink.tsg.discount.beans.FeedDiscount;
import ink.tsg.discount.service.DiscountService;
import ink.tsg.discount.service.FeedDiscountService;
import ink.tsg.feedBack.beans.FeedBack;
import ink.tsg.feedBack.service.FeedBackService;
import ink.tsg.untils.EmailUntils;
import ink.tsg.untils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-15
 */
@Controller
@RequestMapping("/feedDiscount")
public class FeedDiscountController {

	@Autowired
	private FeedDiscountService feedDiscountService;//优惠卷校验码信息
	
	@Autowired
	private DiscountService discountService;//优惠卷信息
	
	@Autowired
	private FeedBackService feedBackService;//反馈信息
	
	/**
	 * 更改中间的优惠卷信息
	 * */
	@RequestMapping(value="/changeCoupon",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeCoupon(@RequestParam("id")Integer id,
			@RequestParam("discountId")Integer discountId) {
		FeedDiscount entity = new FeedDiscount();
		entity.setId(id);
		entity.setDiscountId(discountId);
		boolean b = feedDiscountService.updateById(entity);
		if(b) {
			return Msg.success().add("msg","修改成功！");
		}
		return Msg.fail().add("msg", "修改失败！");
	}
	
	/**
	 * 得到所有的优惠卷
	 * */
	@RequestMapping(value="/getCouponList",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getCouponList(@RequestParam("kwCouponCode")String code,
			@RequestParam("page")Integer page,@RequestParam("limit")Integer limit) {
		EntityWrapper<FeedDiscount> wrapper = new EntityWrapper<>();
		if(code!="") {
			wrapper.eq("discount_code", code);
		}
		Page<Map<String, Object>> couponList = feedDiscountService.selectMapsPage(new Page<FeedDiscount>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有优惠卷信息");
		resultMap.put("total",couponList.getTotal());
		resultMap.put("data",couponList.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 根据反馈人的id得到优惠卷的信息
	 * */
	@RequestMapping(value="/getFeedDiscountInfo",method=RequestMethod.GET)
	@ResponseBody
	public Msg getFeedDiscountInfo(@RequestParam("id")Integer feedId) {
		EntityWrapper<FeedDiscount> wrapper = new EntityWrapper<>();
		wrapper.eq("feed_id", feedId);
		FeedDiscount one = feedDiscountService.selectOne(wrapper);
		if(one!=null) {
			return Msg.success().add("code", one.getDiscountCode()).add("isUse", one.getIsUsed());
		}else {
			return Msg.fail().add("msg", "还未派发校验码");
		}
		
	}
	/**
	 * 发放优惠卷
	 * */
	@RequestMapping(value="/giveCoupon",method=RequestMethod.GET)
	@ResponseBody
	public Msg giveCoupon(@RequestParam("discountId")Integer discountId,
			@RequestParam("feedId")Integer feedId,@RequestParam("email")String feedEmail) {
		
		//获取当前时间
		Date date = new Date();
		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		String nowTime = sdf.format(date);
		//生成UUID
		String uuid = UUID.randomUUID().toString(); 
		uuid = uuid.replace("-", "");//去除多余的-
		
		Discount discountNameById = discountService.selectById(discountId);
		boolean b = EmailUntils.sendEmail(feedEmail, uuid, discountNameById.getDiscountName());
		if(b) {//邮件发送成功
			FeedDiscount discount = new FeedDiscount();
			discount.setDiscountId(discountId);
			discount.setFeedId(feedId);
			discount.setIsUsed(0);
			discount.setGiveTime(nowTime);
			discount.setDiscountCode(uuid);
			boolean insert = feedDiscountService.insert(discount);
			//赠送成功，修改对应的反馈的is_given
			FeedBack feedBack = new FeedBack();
			feedBack.setFeedbackId(feedId);
			feedBack.setFeedIsGiven(0);
			feedBackService.updateById(feedBack);
			if(insert) {
				return Msg.success().add("msg", "发送成功！");
			}else {
				return Msg.fail().add("msg", "邮件发送了，但是插入数据库失败！");
			}
		}else {
			return Msg.fail().add("msg", "邮件发送失败！");
		}
	}
	
	//===========页面跳转===========
	@RequestMapping(value="/getAllCoupon",method=RequestMethod.GET)
	public String getNotUsedCoupon() {
		return "/feedback/couponList";
	}
	@RequestMapping(value="/mangeSortAndDiscount",method=RequestMethod.GET)
	public String mangeSortAndDiscount() {
		return "/feedback/sort-discount";
	}
	
}

