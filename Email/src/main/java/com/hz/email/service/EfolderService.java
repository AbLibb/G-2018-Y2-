package com.hz.email.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.email.mapper.EfolderMapper;
import com.hz.email.pojo.Efolder;

@Service
public class EfolderService {
	
	@Autowired
	private EfolderMapper efolderMapper;
	
	public List<Efolder> queryEfolder(Integer uid){
		return efolderMapper.queryEfolder(uid);
	}
	public int insertFolder(Integer euid,String foldername) {
		return efolderMapper.insertFolder(euid, foldername);
	}
	public int updateEfolder(Efolder efolder) {
		return efolderMapper.updateEfolder(efolder);
	}
	public List<Efolder> queryByEfid(Integer efid){
		return efolderMapper.queryByEfid(efid);
	};
}
