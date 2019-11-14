package ink.tsg.feedBack.service.impl;

import ink.tsg.feedBack.beans.FeedBack;
import ink.tsg.feedBack.mapper.FeedBackMapper;
import ink.tsg.feedBack.service.FeedBackService;
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
public class FeedBackServiceImpl extends ServiceImpl<FeedBackMapper, FeedBack> implements FeedBackService {
		
	@Autowired
	private FeedBackMapper feedBMapper;
}
