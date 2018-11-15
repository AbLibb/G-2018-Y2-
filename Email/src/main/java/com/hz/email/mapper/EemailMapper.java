package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Efile;
import com.hz.email.pojo.Erelation;

public interface EemailMapper {
	/**
	 * 收信箱条数 
	 * @param uid
	 * @return
	 */
	Integer queryShou(@Param("uid")Integer uid
			,@Param("emailstatus")Integer emailstatus,
			 @Param("efid")Integer efid);
	
	
	/**
	 * 发信箱条数 
	 * @param uid
	 * @return
	 */
	Integer queryFa(@Param("uid")Integer uid);
	/**
	 * 草稿箱条数 
	 * @param uid
	 * @return
	 */
	Integer queryText(@Param("uid")Integer uid);
	/**
	 * 垃圾箱条数 
	 * @param uid
	 * @return
	 */
	Integer queryDelete(@Param("uid")Integer uid);
	/**
	 *  发邮件
	 */
	Integer  insertEmail(Eemail eemail);
	Integer insertErelation(Erelation erelation);
	Integer insertEfile(Efile efile);
	
	
	
	/**
	 * 详细信息
	 */
	Eemail getEmail(@Param("scicemail")Integer scicemail,@Param("esid")Integer esid);
	
	/**
	 * 回执
	 */
	Integer  HuizhiEmail(Eemail eemail);
	Integer HuiZhiErelation(Erelation erelation);

	List<Efile> selectFile(@Param("esid")Integer esid);
}
