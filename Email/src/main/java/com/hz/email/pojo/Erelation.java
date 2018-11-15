package com.hz.email.pojo;

import java.util.Date;
import java.util.List;



public class Erelation {
	private int erid;
	private int esid;
	private int receivercodeid;
//	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date readdate;
	private int emailstatus;
	private Euser euser;
	@Override
	public String toString() {
		return "Erelation [erid=" + erid + ", esid=" + esid + ", receivercodeid=" + receivercodeid + ", readdate="
				+ readdate + ", emailstatus=" + emailstatus + ", efid=" + efid + ", booldel=" + booldel + ", scicemail="
				+ scicemail + "]";
	}
	private int efid;
	private int booldel;
	private int scicemail;
	private List<Eemail> EemailList;
	
	
	
	public Euser getEuser() {
		return euser;
	}
	public void setEuser(Euser euser) {
		this.euser = euser;
	}
	public List<Eemail> getEemailList() {
		return EemailList;
	}
	public void setEemailList(List<Eemail> eemailList) {
		EemailList = eemailList;
	}
	public int getErid() {
		return erid;
	}
	public void setErid(int erid) {
		this.erid = erid;
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
		return booldel;
	}
	public void setBooldel(int booldel) {
		this.booldel = booldel;
	}
	public int getScicemail() {
		return scicemail;
	}
	public void setScicemail(int scicemail) {
		this.scicemail = scicemail;
	}
	
	
	
}
