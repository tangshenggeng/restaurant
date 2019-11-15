package ink.tsg.discount.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import ink.tsg.discount.beans.Discount;
import ink.tsg.discount.service.DiscountService;
import ink.tsg.feedBack.beans.FeedBackSort;

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
	private DiscountService discountService;
	
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
	
}

