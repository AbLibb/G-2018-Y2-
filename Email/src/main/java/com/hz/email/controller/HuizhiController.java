package com.hz.email.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Erelation;
import com.hz.email.service.EemailService;

@Controller
@RequestMapping("/HuiZhi/")
public class HuizhiController {

	@Autowired
	EemailService eemailService;
	Integer sum = 0;
	@RequestMapping("doHuizhi")
	@ResponseBody
	public String doHuizhi(Eemail eemail){
System.out.println(eemail);
	    eemailService.HuizhiEmail(eemail);
		sum=eemail.getEsid();
	
		
		return "";
	};
	@RequestMapping("doHuizhi_1")
	@ResponseBody
	public String doHuizhi_1(Erelation erelation){
		System.out.println(erelation);
		erelation.setEsid(sum);
		eemailService.HuiZhiErelation(erelation);
		
		return "1";
	};
}
