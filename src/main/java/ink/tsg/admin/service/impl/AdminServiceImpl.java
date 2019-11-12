package ink.tsg.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import ink.tsg.admin.beans.Admin;
import ink.tsg.admin.mapper.AdminMapper;
import ink.tsg.admin.service.AdminService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-12
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
}
