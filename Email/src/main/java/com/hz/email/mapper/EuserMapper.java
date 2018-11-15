package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.hz.email.pojo.Euser;

public interface EuserMapper {

	/**
	 * 登录
	 * @param uname 账号
	 * @param upwd 密码
	 * @return 登录成功的用户
	 */
	Euser Login(@Param("uname")String uname,
				@Param("upwd")String upwd);
	
	List<Euser> queryUser(Euser euser);
	
	int insert(Euser record);
}
