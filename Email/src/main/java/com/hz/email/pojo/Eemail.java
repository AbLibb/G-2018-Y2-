package com.hz.email.pojo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;



public class Eemail {
	private int esid;
	private String title;
	private String content;
	private int senderid;
	private int getemail;
//	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date senddate;
	private int emailstatus;
	private Erelation erelation;
	private Integer[]  msUid;
	private Integer[]  shouUid;
	private String[] filelist;
	private Euser euser;
	private List<Erelation> erelations;



	@Override
	public String toString() {
		return "Eemail [esid=" + esid + ", title=" + title + ", content=" + content + ", senderid=" + senderid
				+ ", getemail=" + getemail + ", senddate=" + senddate + ", emailstatus=" + emailstatus + ", erelation="
				+ erelation + ", msUid=" + Arrays.toString(msUid) + ", shouUid=" + Arrays.toString(shouUid)
				+ ", filelist=" + Arrays.toString(filelist) + ", euser=" + euser + ", erelations=" + erelations + "]";
	}
	public List<Erelation> getErelations() {
		return erelations;
	}
	public void setErelations(List<Erelation> erelations) {
		this.erelations = erelations;
	}
	public String[] getFilelist() {
		return filelist;
	}
	public Euser getEuser() {
		return euser;
	}
	public void setEuser(Euser euser) {
		this.euser = euser;
	}
	public void setFilelist(String[] filelist) {
		this.filelist = filelist;
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
	public Erelation getErelation() {
		return erelation;
	}
	public void setErelation(Erelation erelation) {
		this.erelation = erelation;
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
