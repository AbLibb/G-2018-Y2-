package com.hz.email.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.email.mapper.EemailMapper;
import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Efile;
import com.hz.email.pojo.Erelation;

@Service
public class EemailService {
	
	@Autowired
	private EemailMapper eemailMapper;
	

	public Integer queryShou(Integer uid,Integer emailstatus,Integer efid){
		return eemailMapper.queryShou(uid,emailstatus,efid);
	};

	public Integer queryFa(Integer uid){
		return eemailMapper.queryFa(uid);
	};

	public Integer queryText(Integer uid) {
		return eemailMapper.queryText(uid);
	};

	public Integer queryDelete(Integer uid) {
		return eemailMapper.queryDelete(uid);
	};
	public Integer  insertEmail(Eemail eemail) {
		return eemailMapper.insertEmail(eemail);
	};
	public Integer insertErelation(Erelation erelation) {
		return eemailMapper.insertErelation(erelation);
	}
	public Integer insertEfile(Efile efile) {
		return eemailMapper.insertEfile(efile);
	}
	public Eemail getEmail(Integer scicemail,Integer esid) {
		return eemailMapper.getEmail(scicemail, esid);
	}
	public  Integer  HuizhiEmail(Eemail eemail) {
		return eemailMapper.HuizhiEmail(eemail);
	}
	public  Integer  HuiZhiErelation(Erelation erelation) {
		return eemailMapper.HuiZhiErelation(erelation);
	}
	public 	List<Efile> selectFile(Integer esid){
		return eemailMapper.selectFile(esid);
	}

}
