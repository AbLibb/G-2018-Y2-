package com.accp.Email.pojo;

import java.util.Date;



public class Erelation {
  private int Erid;
  private int esid;//�ʼ�ID
  private int receivercodeid;//�շ���ID


  private Date readdate;//��һ�ζ�ȡʱ��
  private int emailstatus;//�ʼ�״̬  0:δ�� 1:�Ѷ�
  private int efid;// �ļ��б��
  private int Booldel;// �Ƿ�ɾ��  0: ��1:�� 
  private int scicemail;//�Ƿ�����  0��,1��
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