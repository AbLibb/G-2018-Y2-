package com.hz.email.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.email.mapper.EuserMapper;
import com.hz.email.pojo.Euser;

@Service
public class EuserService {
	
	@Autowired
	private EuserMapper euserMapper;
	
	public Euser Login(String uname,String upwd) {
		
		return euserMapper.Login(uname, upwd);
	}
	
	public List<Euser> queryUser(Euser euser) {
		return euserMapper.queryUser(euser);
	}
	
	public int insert(Euser euser){
		return euserMapper.insert(euser);
	}
}
