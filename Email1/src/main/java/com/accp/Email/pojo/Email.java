package com.accp.Email.pojo;

import java.util.Date;



public class Email {
  private int esid;
  private String title;//����
  private String content;//����
  private int senderid;//������ID
  private  int getemail;//��ִ 0��,1��


  private Date senddate;//����ʱ��
  private int emailstatus;//�ʼ�����״̬   0:�ݸ�   1:����
  private int receivercodeid;
  private int emailstatus2;
  private int count2;
  private Erelation erelation;
	private Integer[]  msUid;
	private Integer[]  shouUid;
	private String[] filelist;
	
  public Erelation getErelation() {
		return erelation;
	}
	public void setErelation(Erelation erelation) {
		this.erelation = erelation;
	}
	public Integer[] getMsUid() {
		return msUid;
	}
	public void setMsUid(Integer[] msUid) {
		this.msUid = msUid;
	}
	public Integer[] getShouUid() {
		return shouUid;
	}
	public void setShouUid(Integer[] shouUid) {
		this.shouUid = shouUid;
	}
	public String[] getFilelist() {
		return filelist;
	}
	public void setFilelist(String[] filelist) {
		this.filelist = filelist;
	}
public int getCount2() {
	return count2;
}
public void setCount2(int count2) {
	this.count2 = count2;
}
public int getEmailstatus2() {
	return emailstatus2;
}
public void setEmailstatus2(int emailstatus2) {
	this.emailstatus2 = emailstatus2;
}
private String username;
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getReceivercodeid() {
	return receivercodeid;
}
public void setReceivercodeid(int receivercodeid) {
	this.receivercodeid = receivercodeid;
}
public int getEsid() {
	return esid;
}
public void setEsid(int esid) {
	this.esid = esid;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getSenderid() {
	return senderid;
}
public void setSenderid(int senderid) {
	this.senderid = senderid;
}
public int getGetemail() {
	return getemail;
}
public void setGetemail(int getemail) {
	this.getemail = getemail;
}
public Date getSenddate() {
	return senddate;
}
public void setSenddate(Date senddate) {
	this.senddate = senddate;
}
public int getEmailstatus() {
	return emailstatus;
}
public void setEmailstatus(int emailstatus) {
	this.emailstatus = emailstatus;
}

}