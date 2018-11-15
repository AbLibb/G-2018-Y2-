package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.email.pojo.Efolder;

public interface EfolderMapper {
	
	/**
	 * 新湖私人邮箱
	 * @param uid
	 * @return
	 */
	List<Efolder> queryEfolder(@Param("uid")Integer uid);
	/**
	 * 新建私人文件夹
	 */
	int insertFolder(@Param("euid")Integer euid,
					 @Param("foldername")String foldername);
	/**
	 * 移动文件夹
	 */
	int updateEfolder(Efolder efolder);
	
	List<Efolder> queryByEfid(@Param("efid")Integer efid);
}
