package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.hz.email.pojo.Euser;

public interface EuserMapper {

	/**
	 * ��¼
	 * @param uname �˺�
	 * @param upwd ����
	 * @return ��¼�ɹ����û�
	 */
	Euser Login(@Param("uname")String uname,
				@Param("upwd")String upwd);
	
	List<Euser> queryUser(Euser euser);
	
	int insert(Euser record);
}
