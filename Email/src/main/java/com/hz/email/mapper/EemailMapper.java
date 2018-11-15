package com.hz.email.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Efile;
import com.hz.email.pojo.Erelation;

public interface EemailMapper {
	/**
	 * ���������� 
	 * @param uid
	 * @return
	 */
	Integer queryShou(@Param("uid")Integer uid
			,@Param("emailstatus")Integer emailstatus,
			 @Param("efid")Integer efid);
	
	
	/**
	 * ���������� 
	 * @param uid
	 * @return
	 */
	Integer queryFa(@Param("uid")Integer uid);
	/**
	 * �ݸ������� 
	 * @param uid
	 * @return
	 */
	Integer queryText(@Param("uid")Integer uid);
	/**
	 * ���������� 
	 * @param uid
	 * @return
	 */
	Integer queryDelete(@Param("uid")Integer uid);
	/**
	 *  ���ʼ�
	 */
	Integer  insertEmail(Eemail eemail);
	Integer insertErelation(Erelation erelation);
	Integer insertEfile(Efile efile);
	
	
	
	/**
	 * ��ϸ��Ϣ
	 */
	Eemail getEmail(@Param("scicemail")Integer scicemail,@Param("esid")Integer esid);
	
	/**
	 * ��ִ
	 */
	Integer  HuizhiEmail(Eemail eemail);
	Integer HuiZhiErelation(Erelation erelation);

	List<Efile> selectFile(@Param("esid")Integer esid);
}
