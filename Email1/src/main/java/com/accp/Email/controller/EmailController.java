package com.accp.Email.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.Email.pojo.Efile;
import com.accp.Email.pojo.Efolder;
import com.accp.Email.pojo.Email;
import com.accp.Email.pojo.Erelation;
import com.accp.Email.pojo.Euser;
import com.accp.Email.service.EmailService;
import com.accp.Email.util.FirstLetterUtil;
@Controller
@RequestMapping("/email")
public class EmailController {
	@Autowired
	private EmailService emailservice;
	
@RequestMapping("/login")
   public String login(){
	return "/WEB-INF/email/login.jsp";
}


@RequestMapping("/dologin")
@ResponseBody
public int dologin(String uname,String upwd,HttpSession session){
	int index=0;
	
	List<Euser> list=this.emailservice.login();
	
	for(Euser a:list){
		if(a.getUname().equals(uname)&&a.getUpwd().equals(upwd)){
			
			index=1;
			
			session.setAttribute("user",a);
			return index;
		}
		
	}
	return 0;
}
@RequestMapping("/main")
public String main(){
	
	return "/WEB-INF/email/zhuye.jsp";
}


@RequestMapping("/zhuye")
@ResponseBody
public List<Efolder> zhuye(int uid){
	
	List<Efolder> list=this.emailservice.zhuyeleft(uid);
	int b;
   for(Efolder a:list){
	   if(a.getEfid()==3){
		 b=this.emailservice.oo(uid,a.getEfid());
	   }else if(a.getEfid()==5){
		   b=this.emailservice.ooo(uid);
	   }else{
	   b=this.emailservice.getcount(uid,a.getEfid());
	   }
	   a.setCount(b);
   }
	return list;
}
@RequestMapping("/laji")
public String laji(int efid,int uid,Model model){
	model.addAttribute("uid",uid);
	model.addAttribute("efid",efid);
	return "/WEB-INF/email/laji.jsp";
}

@RequestMapping("/xiexin")
public String xiexin(){
	return "/WEB-INF/email/Out.jsp";
}
@RequestMapping("/shoujian")
public String shoujian(int efid,int uid,Model model){
	
	
	int count2=this.emailservice.getshoujiancount(uid);
	model.addAttribute("efid", efid);
	model.addAttribute("count2",count2);
	return "/WEB-INF/email/shoujian.jsp";
}

@RequestMapping("/fajian")
public String fajian(int efid,int uid,Model model){
	model.addAttribute("uid",uid);
	model.addAttribute("fid",efid);
	

	return "/WEB-INF/email/fajian.jsp";
}
@RequestMapping("/fajianlist")
@ResponseBody
 public PageBean fajianlist(int uid,int fid,int begin,int size){
	if(size==0){
		size=3;
	}
	 List<Email> list=this.emailservice.getfajian(uid,fid, (begin-1)*size, size);
	 int max=this.emailservice.getfajiancount(uid, fid);
	
	 PageBean ss=new PageBean(begin,size,max,list);
	 for(Email a:list){
		 Euser u=this.emailservice.getname(a.getReceivercodeid());
		
		 a.setUsername(u.getUname());
	 }
	 return ss;
	
}
   
@RequestMapping("/belaji")
@ResponseBody
public int belaji(int esid,int uid){
	int index=0;
    System.out.println(uid);
    List<Email> list=this.emailservice.getfajianone(uid,esid);
    for(Email a:list){
    	if(a.getEmailstatus2()==1){
    		index=1;
    	}else{
    		this.emailservice.belaji(5,esid);
    	}
    }

	return index;
}


@RequestMapping("/belajis")
@ResponseBody
public int belajis(Integer[] value,int uid){
	int index=0;
	
	for(int i=0;i<value.length;i++){
		List<Email> list=this.emailservice.getfajianone(uid,value[i]);
		for(Email a:list){
			if(a.getEmailstatus2()==1){
				index=1;
			}else{
				this.emailservice.belaji(5, value[i]);
			}
		}
		
	}
	return index;
}
@RequestMapping("/savewen")
@ResponseBody
public int savewen(int id,String name){
	int index=0;
	
	List<Efolder> list=this.emailservice.zhuyeleft(id);
	for(Efolder a:list){
		
		if(a.getFoldername().equals(name)){
			index=1;
			return index;
		}else{
			this.emailservice.savewen(id,name);
			index=2;
			return index;
		}
	}
	
	return index; 
}
@RequestMapping("/shoujianlist.action")
@ResponseBody
public PageBean shoujianlist(int begin,int size,int uid){
	if(size==0){
		size=3;
	}
	 List<Email> list=this.emailservice.getshoujian(uid,(begin-1)*size, size);
	 for(Email a:list){
		Euser user=this.emailservice.getname(a.getSenderid());
		 a.setUsername(user.getUname());
	 }
	 int max=this.emailservice.getshoujiancount(uid);
	 PageBean bean=new PageBean(begin,size,max,list);
	 return bean;
}

@RequestMapping("/yidu.action")
@ResponseBody
public int yidu(Integer[] value,int uid){
	int index=0;
	for(int i=0;i<value.length;i++){
		Erelation a=this.emailservice.getone2(value[i], uid);
	    if(a.getEmailstatus()==1){
	    	index=1;
	    }else{
		this.emailservice.updateyd(new Date(), a.getErid());
	}
	}
	return index;
}
@RequestMapping("/weidu.action")
@ResponseBody
public int weidu(Integer[] value,int uid){
	int index=0;
	for(int i=0;i<value.length;i++){
		Erelation a=this.emailservice.getone2(value[i], uid);
		if(a.getEmailstatus()==0){
		  index=1;	
		}else{
		this.emailservice.updatewd(new Date(),a.getErid());
	}
		}

    return index;
}


 @RequestMapping("/yichu.action")
 @ResponseBody
 public int yichu(Integer[] value,int id,int uid){
	 int index=0;
	
	 for(int i=0;i<value.length;i++){
		
		 Erelation a=this.emailservice.getone(value[i], uid);
		 
		 if(a.getEfid()==id){
			 index=1;
		 }else{
			 this.emailservice.updateyichu(id,a.getErid());
		 }
	 }
	 return index;
 }
 
 
 @RequestMapping("/yichu2.action")
 @ResponseBody
 public int yichu2(Integer[] value,int id,int uid){
	 int index=0;
	System.out.println(id);
	System.out.println(uid);
	 for(int i=0;i<value.length;i++){
		System.out.println(value[i]);
		 Erelation a=this.emailservice.getone2(value[i], uid);
		 
		 if(a.getEfid()==id){
			 index=1;
		 }else{
			 this.emailservice.updateyichu2(id,a.getErid());
		 }
	 }
	 return index;
 }
  @RequestMapping("/weiduu.action")
  @ResponseBody
  public int weiduu(int efid,int uid){
	  int index=0;
	  index=this.emailservice.weidu(uid, efid);
	  return index;
  }
  @RequestMapping("/dolajilist.action")
  @ResponseBody
  public PageBean dolajilist(int uid,int begin,int size){
	 
	  if(size==0){
			size=1;
		}
		 List<Email> list=this.emailservice.getlajjilist(uid,(begin-1)*size, size);
		 for(Email a:list){
			Euser user=this.emailservice.getname(a.getSenderid());
			 a.setUsername(user.getUname());
		 }
		 int max=this.emailservice.getlajicount(uid);
		 PageBean bean=new PageBean(begin,size,max,list);
		 return bean;
  }
  
  @RequestMapping("/del")
  @ResponseBody
  public int del(Integer[] value){
	  int index=0;
	  for(int i=0;i<value.length;i++){
		  List<Erelation> list=this.emailservice.dellist(value[i]);
		  for(Erelation a:list){
			  this.emailservice.delere(a.getErid());
		  }
		  List<Efile> lists=this.emailservice.delfjlist(value[i]);
			  for(Efile a:lists){
				  this.emailservice.delfj(value[i]);
			  }
		  
		  this.emailservice.delemail(value[i]);
	  }
	  return index;
  }
  @RequestMapping("/getuser")
  @ResponseBody
  public List<Euser> getuser(){
	  List<Euser> list=this.emailservice.login();
	
	  return list;
  }
  
  @RequestMapping("/getusermohu")
  @ResponseBody
  public List<Euser> getusermohu(String uname){
	 System.out.println(uname);
	  List<Euser> list=this.emailservice.mohuuser(uname);
	  return list;  
  }
  @RequestMapping("/fajianmohu")
  @ResponseBody
  public List<Email> fajianmohu(String fajian,int uid){
	 
	 List<Euser> listuser=this.emailservice.mohuuser(fajian);
	
	
	 List<Email> listemail=null;
	 for(Euser a:listuser){
		
		   listemail=this.emailservice.getshoujianmohu (uid,a.getUid());
         for(Email c:listemail){
        	 c.setUsername(a.getUname());
         }
         return listemail;
	 }
	
	  
	  return null;
	  
  }
  @RequestMapping("/zhuce")
  public String zhuce(){
	  return "/WEB-INF/email/zhuce.jsp";
  }
  
  
  @RequestMapping("/dozhuce")
  @ResponseBody
  public Object doinsert(Euser euser) {
	  int index=0;
		euser.setAcronym(FirstLetterUtil.getFirstLetter(euser.getUname()));	
		this.emailservice.insert(euser);
		return index;
	}
  @RequestMapping("/fileEmail")
	@ResponseBody
	public String fileEmail(int uid,Integer[] data_shou,Integer[] data_ms,String title,String content,Integer getemail,String[] data_img,HttpSession session) throws UnsupportedEncodingException {
		
		
		List<Integer> index = new ArrayList<Integer>();
		if (data_shou != null && data_ms != null) {
			for (int i = 0; i < data_shou.length; i++) {
				for (int j = 0; j < data_ms.length; j++) {
					if (data_shou[i] == data_ms[j]) {
						
						index.add(data_shou[j]);
					}
				}
			}
		}

		List<Integer> data_pd_ = Arrays.asList(data_shou);
		List<Integer> data_pd = new ArrayList<Integer>(data_pd_);
		
		//�ʼ�
		Email eemail = new Email();
		String titles = new String(title.getBytes("iso-8859-1"),"utf-8");
		String contents = new String(content.getBytes("iso-8859-1"),"utf-8");
		eemail.setMsUid(data_ms);
		eemail.setSenderid(uid);
		eemail.setShouUid(data_shou);
		eemail.setTitle(titles);
		eemail.setContent(contents);
		eemail.setGetemail(getemail);
		eemail.setFilelist(data_img);
		eemail.setSenddate(new Date());
		//����
		System.out.println(eemail.getSenddate());
		emailservice.insertEmail(eemail);
		
		
		//��ͨ��
		Erelation erelation = new Erelation();
		for(Integer shou : data_shou) {
			
			
			erelation.setEsid(eemail.getEsid());
			erelation.setReceivercodeid(shou);
			erelation.setEmailstatus(0);
			erelation.setEfid(3);
			erelation.setBooldel(0);
			erelation.setScicemail(0);
			
			emailservice.insertErelation(erelation);
		}
		//����
		Erelation erelation_ms = new Erelation();
		if(data_ms!=null) {
			for(Integer ms : data_ms) {
				
				erelation_ms.setEsid(eemail.getEsid());
				erelation_ms.setReceivercodeid(ms);
				erelation_ms.setEmailstatus(0);
				erelation_ms.setEfid(3);
				erelation_ms.setBooldel(0);
				erelation_ms.setScicemail(1);
			
				emailservice.insertErelation(erelation_ms);
			}
		}
		
		Erelation erelation_msNew = new Erelation();
		erelation_msNew.setEsid(eemail.getEsid());
		erelation_msNew.setReceivercodeid(1);
		erelation_msNew.setEmailstatus(0);
		erelation_msNew.setEfid(4);
		erelation_msNew.setBooldel(0);
		erelation_msNew.setScicemail(0);
		emailservice.insertErelation(erelation_msNew);
		
	Efile efile = new Efile();
		if(data_img!=null) {
			for(String img : data_img) {
				String imgs = new String(img.getBytes("iso-8859-1"),"utf-8");
				efile.setFilename(imgs);
				efile.setEsid(eemail.getEsid());
				emailservice.insertEfile(efile);
			}
		}
		
		return "";
	}
}
