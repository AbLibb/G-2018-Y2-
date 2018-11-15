package com.accp.Email.controller;

import java.util.List;

public class PageBean {
       public int getCuratrpage() {
		return curatrpage;
	}
	public void setCuratrpage(int curatrpage) {
		this.curatrpage = curatrpage;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public PageBean(){}
	public PageBean(int currpage,int size,int totalSize,List data){
		this.curatrpage=currpage;
		this.size=size;
		this.max=totalSize;
		this.data=data;
		//��һҳ
		this.prev=currpage-1>=1?currpage-1:1;
		//�ܵ�ҳ��
		this.totalpage=totalSize%size==0?totalSize/size:totalSize/size+1;
		this.next=currpage+1>=totalpage?totalpage:currpage+1;
	}
	private int curatrpage;
       private int size;
       private List data;
       private int max;//�ܵļ�¼
       private int totalpage;//�ܵ�ҳ��
       private int next;
       private int prev;//��һҳ
       
}
