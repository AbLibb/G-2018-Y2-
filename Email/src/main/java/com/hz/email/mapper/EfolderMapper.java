package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.email.pojo.Efolder;

public interface EfolderMapper {
	
	/**
	 * �º�˽������
	 * @param uid
	 * @return
	 */
	List<Efolder> queryEfolder(@Param("uid")Integer uid);
	/**
	 * �½�˽���ļ���
	 */
	int insertFolder(@Param("euid")Integer euid,
					 @Param("foldername")String foldername);
	/**
	 * �ƶ��ļ���
	 */
	int updateEfolder(Efolder efolder);
	
	List<Efolder> queryByEfid(@Param("efid")Integer efid);
}
