package com.accp.Email.pojo;

import java.util.Date;



public class Erelation {
  private int Erid;
  private int esid;//邮件ID
  private int receivercodeid;//收发人ID


  private Date readdate;//第一次读取时间
  private int emailstatus;//邮件状态  0:未读 1:已读
  private int efid;// 文件夹编号
  private int Booldel;// 是否删除  0: 是1:否 
  private int scicemail;//是否密送  0否,1是
public int getErid() {
	return Erid;
}
public void setErid(int erid) {
	Erid = erid;
}
public int getEsid() {
	return esid;
}
public void setEsid(int esid) {
	this.esid = esid;
}
public int getReceivercodeid() {
	return receivercodeid;
}
public void setReceivercodeid(int receivercodeid) {
	this.receivercodeid = receivercodeid;
}
public Date getReaddate() {
	return readdate;
}
public void setReaddate(Date readdate) {
	this.readdate = readdate;
}
public int getEmailstatus() {
	return emailstatus;
}
public void setEmailstatus(int emailstatus) {
	this.emailstatus = emailstatus;
}
public int getEfid() {
	return efid;
}
public void setEfid(int efid) {
	this.efid = efid;
}
public int getBooldel() {
	return Booldel;
}
public void setBooldel(int booldel) {
	Booldel = booldel;
}
public int getScicemail() {
	return scicemail;
}
public void setScicemail(int scicemail) {
	this.scicemail = scicemail;
}
  
}
