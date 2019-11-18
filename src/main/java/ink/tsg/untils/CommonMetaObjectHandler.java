package ink.tsg.untils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.reflection.MetaObject;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
/**
 * 自定义填充公共字段 
 * */
public class CommonMetaObjectHandler extends MetaObjectHandler {
	
	/**
	 * 插入时
	 * */
	@Override
	public void insertFill(MetaObject metaObject) {
		// custState 自动填充为 1（未删除状态）
		Object contactState = getFieldValByName("feedDestroy", metaObject);
		if (contactState == null) {
			setFieldValByName("feedDestroy", 1, metaObject);
		}
		Object isDel = getFieldValByName("isDel", metaObject);
		if (isDel == null) {
			setFieldValByName("isDel", 1, metaObject);
		}
		Object foodState = getFieldValByName("foodState", metaObject);
		if (foodState == null) {
			setFieldValByName("foodState", 1, metaObject);
		}
		Object isArrival = getFieldValByName("isArrival", metaObject);
		if (isArrival == null) {
			setFieldValByName("isArrival", 200, metaObject);
		}
		 
		// creatTime自动填充为当前时间
		
		Object createTime = getFieldValByName("createTime", metaObject);
		if (createTime == null) {
			Date date = new Date();
			SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
			String nowTime = sdf.format(date);
			setFieldValByName("createTime", nowTime, metaObject);
		}
	}
	/**
	 * 更新时
	 * */
	@Override
	public void updateFill(MetaObject metaObject) {
		// creatTime自动填充为当前时间
		/*
		 * Object updataTime = getFieldValByName("updataTime", metaObject); if
		 * (updataTime == null) { Date date = new Date(); SimpleDateFormat dateFormat=
		 * new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss"); setFieldValByName("updataTime",
		 * dateFormat.format(date), metaObject); }
		 */
		// shipTime自动填充为当前时间
		/*
		 * Object shipTime = getFieldValByName("shipTime", metaObject); if (shipTime ==
		 * null) { Date date = new Date(); SimpleDateFormat dateFormat= new
		 * SimpleDateFormat("yyyy-MM-dd :hh:mm:ss"); setFieldValByName("shipTime",
		 * dateFormat.format(date), metaObject); }
		 */
	}

}
