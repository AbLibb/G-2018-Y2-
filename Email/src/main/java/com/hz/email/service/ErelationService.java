package com.hz.email.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.email.mapper.ErelationMapper;
import com.hz.email.pojo.Erelation;

@Service
public class ErelationService {
	
	@Autowired
	private ErelationMapper erelationMapper;
	
	public List<Erelation> queryAll(Integer begin,Integer size,Integer uid,String title,Integer efid,Integer emailstatus){
		System.out.println(emailstatus+"---------------------------------------------------------------------------------");
		return erelationMapper.queryAll(begin, size,uid,title,efid,emailstatus);
	};

	public int queryCount(Integer uid,String title,Integer efid,Integer emailstatus) {
		return erelationMapper.queryCount(uid,title,efid,emailstatus);
	};
	
	public int delete(Integer[] chk_value) {
		return erelationMapper.delete(chk_value);
	}
	public int yidu(Integer[]  chk_value) {
		return erelationMapper.yidu(chk_value);
	}
	
	public int weidu(Integer[]  chk_value) {
		return erelationMapper.weidu(chk_value);
	}
}
