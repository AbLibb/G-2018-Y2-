package com.hz.email.pojo;

public class Efile {
	private int efid;
	private int esid;
	private String fileur;
	private String filename;
	private String filesize;
	
	
	
	
	
	
	
	
	
	
	@Override
	public String toString() {
		return "Efile [efid=" + efid + ", esid=" + esid + ", fileur=" + fileur + ", filename=" + filename
				+ ", filesize=" + filesize + "]";
	}
	public int getEfid() {
		return efid;
	}
	public void setEfid(int efid) {
		this.efid = efid;
	}
	public int getEsid() {
		return esid;
	}
	public void setEsid(int esid) {
		this.esid = esid;
	}
	public String getFileur() {
		return fileur;
	}
	public void setFileur(String fileur) {
		this.fileur = fileur;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	
	
}
