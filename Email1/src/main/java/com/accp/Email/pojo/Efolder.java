package com.accp.Email.pojo;

public class Efolder {
  private int efid;
  private Integer euid;//用户ID，null为公用
  private String foldername;//文件名
  private int count;
  private int count2;
public int getCount2() {
	return count2;
}
public void setCount2(int count2) {
	this.count2 = count2;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public int getEfid() {
	return efid;
}
public void setEfid(int efid) {
	this.efid = efid;
}
public Integer getEuid() {
	return euid;
}
public void setEuid(Integer euid) {
	this.euid = euid;
}
public String getFoldername() {
	return foldername;
}
public void setFoldername(String foldername) {
	this.foldername = foldername;
}

}
