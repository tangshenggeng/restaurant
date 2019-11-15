package ink.tsg.discount.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

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
	private FeedDiscountService feedDiscountService;
	
	@Autowired
	private DiscountService discountService;
	
	@Autowired
	private FeedBackService feedBackService;
	
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
	
	
}

