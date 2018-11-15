package com.accp.Email.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.Email.mapper.EmailMapper;
import com.accp.Email.pojo.Efile;
import com.accp.Email.pojo.Efolder;
import com.accp.Email.pojo.Email;
import com.accp.Email.pojo.Erelation;
import com.accp.Email.pojo.Euser;

@Service

public class EmailService {
 @Autowired
 private EmailMapper maper;
 
 public List<Euser> login(){
	 return maper.login();
 }
 public List<Efolder> zhuyeleft(int uid){
	 return maper.zhuyeleft(uid);
 }
 public int getcount(int euid,int efid){
	 return maper.getcount(euid, efid);
 }
 
 public List<Email> getfajian(int senderid,int efid,int begin,int size){
	 return maper.getfajian(senderid, efid,begin,size);
 }
 public Euser getname(int uid){
	 return maper.getname(uid);
 }
 public  int getfajiancount(int senderid,int efid){
	 return maper.getfajiancount(senderid, efid);
 }
 public void belaji(int fid,int sid){
	 maper.belaji(fid,sid);
 }
 public void savewen(int euid,String foldername){
	 maper.savewen(euid, foldername);
 }
 public List<Email> getshoujian(int receivercodeid,int begin,int size){
	 return maper.getshoujian(receivercodeid, begin, size);
 }
 public int getshoujiancount(int receivercodeid){
	 return maper.getshoujiancount(receivercodeid);
 }
 public Erelation getone(int esid,int uid){
	 return maper.getone(esid, uid);
 }
 public Erelation getone2(int esid,int uid){
	 return maper.getone2(esid, uid);
 }
 
 public void updateyd(Date time,int Erid){
	  maper.updateyd(time, Erid);
 }
 public void updatewd(Date time ,int Erid){
	 maper.updatewd(time, Erid);
 }
 public void updateyichu(int efid,int Erid ){
	 maper.updateyichu(efid, Erid);
 }
 public void updateyichu2(int efid,int Erid ){
	 maper.updateyichu2(efid, Erid);
 }
 public int weidu(int uid,int efid){
	 return maper.weidu(uid, efid);
 }
 public List<Email> getlajjilist(int uid,int begin,int size){
	 return maper.getlajilist(uid, begin,size);
 }
 
 public int getlajicount(int uid){
	 return maper.getlajicount(uid);
 }
 public List<Erelation> dellist(int esid){
	 return maper.dellist(esid);
 }
 public void  delere(int Erid){
	 maper.delere(Erid);
 }
 public void delemail(int esid){
	 maper.delemail(esid);
 }
 public List<Euser> mohuuser(String uname){
	 return maper.mohuuser(uname);
 }
 public List<Email> getshoujianmohu(int receivercodeid,int uid){
	 return maper.getshoujianmohu(receivercodeid, uid);
 }
 public int getshoujianmohucount(int receivercodeid,int uid){
	 return maper.getshoujianmohucount(receivercodeid, uid);
 }
 public List<Email> getfajianone(int senderid,int esid ){
	 return maper.getfajianone(senderid, esid);
 }
 public int insert(Euser record){
	 return maper.insert(record);
 }
   public Integer  insertEmail(Email eemail) {
		return maper.insertEmail(eemail);
	};
	public Integer insertErelation(Erelation erelation) {
		return maper.insertErelation(erelation);
	}
	public Integer insertEfile(Efile efile) {
		return maper.insertEfile(efile);
	}
	public int oo(int receivercodeid,int efid ){
		return maper.oo(receivercodeid, efid);
	}
	public int ooo(int receivercodeid){
    return maper.ooo(receivercodeid);
	}
	public void delfj(int esid){
		maper.delfj(esid);
	}
	public List<Efile> delfjlist(int esid){
		return maper.delfjlist(esid);
	}
}
