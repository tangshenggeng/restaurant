package ink.tsg.feedBack.service.impl;

import ink.tsg.feedBack.beans.FeedBackSort;
import ink.tsg.feedBack.mapper.FeedBackSortMapper;
import ink.tsg.feedBack.service.FeedBackSortService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-14
 */
@Service
public class FeedBackSortServiceImpl extends ServiceImpl<FeedBackSortMapper, FeedBackSort> implements FeedBackSortService {
	
	@Autowired
	private FeedBackSortMapper feedBSortMapper;
	
}
