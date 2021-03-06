package ink.tsg.discount.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
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

import ink.tsg.discount.beans.Discount;
import ink.tsg.discount.beans.FeedDiscount;
import ink.tsg.discount.service.DiscountService;
import ink.tsg.discount.service.FeedDiscountService;
import ink.tsg.feedBack.beans.FeedBackSort;
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
@RequestMapping("/discount")
public class DiscountController {
	
	@Autowired
	private DiscountService discountService;//优惠卷
	
	@Autowired
	private FeedDiscountService feedDService;//中间表
	
	/**
	 * 添加优惠卷
	 * */
	@RequestMapping(value="/addDiscount",method=RequestMethod.GET)
	@ResponseBody
	public Msg addSort(@RequestParam("discountName") String discountName) {
		Discount entity = new Discount();
		entity.setDiscountName(discountName);
		entity.setDiscountDel(1);
		boolean b = discountService.insert(entity);
		if(b) {
			return Msg.success().add("msg", "添加成功！");
		}
		return Msg.fail().add("msg", "添加失败！");
	}
	
	
	
	/**
	 * 得到所有的优惠卷，CRUD用
	 * */
	@RequestMapping(value="/getDiscountList",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFeedSortList(@RequestParam("page")Integer page,
			@RequestParam("limit")Integer limit) {
		EntityWrapper<Discount> wrapper = new EntityWrapper<>();
		wrapper.eq("discount_del", 1);
		Page<Map<String, Object>> mapsPage = discountService.selectMapsPage(new Page<Discount>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有优惠卷信息");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	
	}
	/**
	 * 确认使用
	 * */
	@RequestMapping(value="/userDiscountByCode",method=RequestMethod.GET)
	@ResponseBody
	public Msg userDiscountByCode(@RequestParam("code")String code) {
		EntityWrapper<FeedDiscount> wrapper = new EntityWrapper<>();
		wrapper.eq("discount_code", code);
		FeedDiscount discount = feedDService.selectOne(wrapper);
		if(discount == null) {
			return Msg.fail().add("msg", "校验码有误！");
		}
		//获取当前时间，即使用的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String usedTime = sdf.format(new Date());
		FeedDiscount entity = new FeedDiscount();
		entity.setId(discount.getId());
		entity.setUsedTime(usedTime);
		entity.setIsUsed(1);
		boolean b = feedDService.updateById(entity);
		if(b) {
			return Msg.success();
			
		}
		return Msg.fail().add("msg", "使用失败！");
	}
	
	/**
	 * 使用优惠卷模态框
	 * */
	@RequestMapping(value="/useDiscountByCode",method=RequestMethod.GET)
	@ResponseBody
	public Msg useDiscountByCode(@RequestParam("money")double money,@RequestParam("code")String code ) {
		//先根据code拿到优惠卷的信息
		EntityWrapper<FeedDiscount> feedDiscountWra = new EntityWrapper<>();
		feedDiscountWra.eq("discount_code", code).eq("is_used", 0);
		FeedDiscount feedDiscount = feedDService.selectOne(feedDiscountWra);
		if(feedDiscount == null) {
			return Msg.fail().add("msg", "校验码重复使用！");
		}
		Discount discountById = discountService.selectById(feedDiscount.getDiscountId());
		Double num = discountById.getDiscountNum();
		double afterMoney = money*num;
		//保留两位有效数字
		String douStr = String.format("%.2f", afterMoney);
		return Msg.success().add("discountName", discountById.getDiscountName())
				.add("afterMoney", douStr);
	}
	
	/**
	 * 查询所有的优惠卷
	 * */
	@RequestMapping(value="/getAll",method=RequestMethod.GET)
	@ResponseBody
	public List<Discount> getAll() {
		EntityWrapper<Discount> wrapper = new EntityWrapper<>();
		wrapper.eq("discount_del",1);
		List<Discount> list = discountService.selectList(wrapper);
		return list;
	}
	//========页面跳转===========
	@RequestMapping(value="/useCouponByCode",method=RequestMethod.GET)
	public String useCouponByCode() {
		return "/feedback/useCoupon";
	}
}

