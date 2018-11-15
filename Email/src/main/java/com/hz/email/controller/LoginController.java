package com.hz.email.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hz.email.pojo.Euser;
import com.hz.email.service.EuserService;
import com.hz.email.util.FirstLetterUtil;


@Controller
@RequestMapping("/User/")
public class LoginController {
	
	@Autowired
	private EuserService euserService;
	
	@RequestMapping("Login")
	public String Login(){
		return "/WEB-INF/view/Login.html";
	}
	
	@RequestMapping("doLogin")
	@ResponseBody
	public Object doLogin(String number,String password,HttpSession session){
		Map<String,Object> map = new HashMap<String,Object>();
		Euser user = euserService.Login(number, password);
		if(user!=null) {
			session.setAttribute("user", user);
			session.setAttribute("uid", user.getUid());
			map.put("msg", "µÇÂ¼³É¹¦£¡");
			map.put("code", 200);
			return map;
		}else {
			map.put("msg", "µÇÂ¼Ê§°Ü£¡");
			return map;
		}
	}
	@RequestMapping("OutLogin")
	@ResponseBody
	public Object OutLogin(HttpSession session){
		 session.invalidate();
		 return "1";
	}
	@RequestMapping("zhuce")
	public String zhuce(){
		 return "/WEB-INF/view/zhuce.jsp";
	}
	@RequestMapping("doinsert")
	@ResponseBody
	public Object doinsert(Euser euser) {
		euser.setAcronym(FirstLetterUtil.getFirstLetter(euser.getUname()));	
		euserService.insert(euser);
		return "bol:true";
	}
}
