package com.hz.email.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Efile;
import com.hz.email.pojo.Erelation;
import com.hz.email.service.EemailService;
import com.hz.email.util.Base64ConvertImageUtil;

@Controller
@RequestMapping("/file/")
public class EmailController {

		@Autowired
		private EemailService eemailService;
	
		@RequestMapping("fileEmail")
		@ResponseBody
		public String fileEmail(Integer[] data_shou,Integer[] data_ms,String title,String content,Integer getemail,String[] data_img,HttpSession session,Integer xuanze) throws UnsupportedEncodingException {

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
			for (Integer pd : index) {
			
				data_pd.remove(pd);
			}
			
			//发邮件
			if(xuanze==1) {
				//邮件
				Eemail eemail = new Eemail();
				String titles = new String(title.getBytes("iso-8859-1"),"utf-8");
				String contents = new String(content.getBytes("iso-8859-1"),"utf-8");
				eemail.setMsUid(data_ms);
				eemail.setSenderid(Integer.parseInt(session.getAttribute("uid").toString()));
				eemail.setShouUid(data_shou);
				eemail.setTitle(titles);
				eemail.setContent(contents);
				eemail.setGetemail(getemail);
				eemail.setFilelist(data_img);
				eemail.setEmailstatus(0);
				//新增
				eemailService.insertEmail(eemail);
				
				
				//普通送
				Erelation erelation = new Erelation();
				for(Integer shou : data_shou) {
					
					System.out.println(shou);
					erelation.setEsid(eemail.getEsid());
					erelation.setReceivercodeid(shou);
					erelation.setEmailstatus(1);
					erelation.setEfid(3);
					erelation.setBooldel(0);
					erelation.setScicemail(0);
					System.out.println(erelation);
					eemailService.insertErelation(erelation);
				}
				//密送
				Erelation erelation_ms = new Erelation();
				if(data_ms!=null) {
					for(Integer ms : data_ms) {
						System.out.println(ms);
						erelation_ms.setEsid(eemail.getEsid());
						erelation_ms.setReceivercodeid(ms);
						erelation_ms.setEmailstatus(1);
						erelation_ms.setEfid(3);
						erelation_ms.setBooldel(0);
						erelation_ms.setScicemail(1);
						System.out.println(erelation_ms);
						eemailService.insertErelation(erelation_ms);
					}
				}
				
				Erelation erelation_msNew = new Erelation();
				erelation_msNew.setEsid(eemail.getEsid());
				erelation_msNew.setReceivercodeid(Integer.parseInt(session.getAttribute("uid").toString()));
				erelation_msNew.setEmailstatus(1);
				erelation_msNew.setEfid(4);
				erelation_msNew.setBooldel(0);
				erelation_msNew.setScicemail(0);
				eemailService.insertErelation(erelation_msNew);
				
			Efile efile = new Efile();
				if(data_img!=null) {
					for(String img : data_img) {
						efile.setFilename(img);
						efile.setEsid(eemail.getEsid());
						eemailService.insertEfile(efile);
					}
				}
				
			}else {
				//存草稿
				Eemail eemail = new Eemail();
				String titles = new String(title.getBytes("iso-8859-1"),"utf-8");
				String contents = new String(content.getBytes("iso-8859-1"),"utf-8");
				eemail.setMsUid(data_ms);
				eemail.setSenderid(Integer.parseInt(session.getAttribute("uid").toString()));
				eemail.setShouUid(data_shou);
				eemail.setTitle(titles);
				eemail.setContent(contents);
				eemail.setGetemail(getemail);
				eemail.setFilelist(data_img);
				eemail.setEmailstatus(1);
				//新增
				eemailService.insertEmail(eemail);
				
				
				//普通送
				Erelation erelation = new Erelation();
				for(Integer shou : data_shou) {
					
					System.out.println(shou);
					erelation.setEsid(eemail.getEsid());
					erelation.setReceivercodeid(shou);
					erelation.setEmailstatus(1);
					erelation.setEfid(6);
					erelation.setBooldel(0);
					erelation.setScicemail(0);
					System.out.println(erelation);
					eemailService.insertErelation(erelation);
				}
				//密送
				Erelation erelation_ms = new Erelation();
				if(data_ms!=null) {
					for(Integer ms : data_ms) {
						System.out.println(ms);
						erelation_ms.setEsid(eemail.getEsid());
						erelation_ms.setReceivercodeid(ms);
						erelation_ms.setEmailstatus(1);
						erelation_ms.setEfid(6);
						erelation_ms.setBooldel(0);
						erelation_ms.setScicemail(1);
						System.out.println(erelation_ms);
						eemailService.insertErelation(erelation_ms);
					}
				}
				
				Erelation erelation_msNew = new Erelation();
				erelation_msNew.setEsid(eemail.getEsid());
				erelation_msNew.setReceivercodeid(Integer.parseInt(session.getAttribute("uid").toString()));
				erelation_msNew.setEmailstatus(1);
				erelation_msNew.setEfid(6);
				erelation_msNew.setBooldel(0);
				erelation_msNew.setScicemail(0);
				eemailService.insertErelation(erelation_msNew);
				
			Efile efile = new Efile();
				if(data_img!=null) {
					for(String img : data_img) {
						efile.setFilename(img);
						efile.setEsid(eemail.getEsid());
						eemailService.insertEfile(efile);
					}
				}
			}
			

		
		
			return "";
		}
}
