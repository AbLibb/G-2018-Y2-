package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.email.pojo.Erelation;

public interface ErelationMapper {
	/**
	 * ��ѯȫ��
	 */
	List<Erelation> queryAll(@Param("begin")Integer begin,
							 @Param("size")Integer size,
							 @Param("uid")Integer uid,
							 @Param("title")String title,
							 @Param("efid")Integer efid,
							 @Param("emailstatus")Integer emailstatus);
	/**
	 * ȫ������
	 * @return
	 */
	int queryCount(@Param("uid")Integer uid,@Param("title")String title,@Param("efid")Integer efid,@Param("emailstatus")Integer emailstatus);
	
	int delete(Integer[] chk_value);
	
	int yidu(Integer[]  chk_value);
	
	int weidu(Integer[]  chk_value);
}
