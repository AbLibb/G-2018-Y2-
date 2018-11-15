package com.hz.email.controller;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hz.email.mapper.EuserMapper;
import com.hz.email.pojo.Eemail;
import com.hz.email.pojo.Efile;
import com.hz.email.pojo.Efolder;
import com.hz.email.pojo.Erelation;
import com.hz.email.pojo.Euser;
import com.hz.email.pojo.PageBean;
import com.hz.email.service.EemailService;
import com.hz.email.service.EfolderService;
import com.hz.email.service.ErelationService;

@Controller
@RequestMapping("/Home/")
public class HomeController {
	
	Map<String,Object> map = new HashMap<String,Object>();

	@Autowired
	private EfolderService efolderService;
	@Autowired
	private EemailService eemailService;
	@Autowired
	private ErelationService erelationService;
	@Autowired
	private EuserMapper euserMapper;
	
	@RequestMapping("index")
	public String index(Model mo,HttpSession session){
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
		mo.addAttribute("fa",eemailService.queryFa(uid));
		mo.addAttribute("cao",eemailService.queryText(uid));
		mo.addAttribute("la",eemailService.queryDelete(uid));
		return "/WEB-INF/view/index.jsp";
	}
	//未读条数
	@RequestMapping("shou")
	@ResponseBody
	public int shou(HttpSession session,Integer efid){
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
	
		return eemailService.queryShou(uid,1,efid);
	};
	//未读条数
	@RequestMapping("yiduss")
	@ResponseBody
	public int yidu(HttpSession session,Integer efid){
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
		return eemailService.queryShou(uid,null,efid);
	};
	@RequestMapping("image")
	@ResponseBody
	public List<Efile> getImage(Integer esid){
		return eemailService.selectFile(esid);
	};
	//查询邮箱
	@RequestMapping("showEmailFile")
	@ResponseBody
	public Object showEmailFile(HttpSession session){
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
		return efolderService.queryEfolder(uid);
	};
	@RequestMapping("woder")
	public String woder(){
		return "/WEB-INF/view/Out.jsp";
	}
	@RequestMapping("fa")
	public String fa(Model mo,Integer efid){
		return "/WEB-INF/view/fa.jsp";
	}
	@RequestMapping("info")
	public String info(Model mo,Integer erid,Integer esid,Integer scicemail){
		Integer[] id ={erid};
		id[0]=erid;
		mo.addAttribute("esid",esid);
		mo.addAttribute("scicemail",scicemail);
		erelationService.yidu(id);
		
		return "/WEB-INF/view/info.jsp";
	}
	@RequestMapping("Get")
	public String Get(){
		return "/WEB-INF/view/Get.jsp";
	}
	@RequestMapping("siren")
	public String siren(Model mo,Integer efid) {
		mo.addAttribute("efid",efid);	
		mo.addAttribute("Efolder",efolderService.queryByEfid(efid).get(0).getFoldername());
		return "/WEB-INF/view/siren.jsp";
	}
	@RequestMapping("getFoldername")
	@ResponseBody
	public Map<String, Object> getFoldername(Integer efid) {
		map.put("Foldername", efolderService.queryByEfid(efid).get(0).getFoldername());
		return map;
	}
	@RequestMapping("getEemail")
	@ResponseBody
	public Object getEemail(Integer esid,Integer scicemail,HttpSession session) {
		Eemail list =eemailService.getEmail(scicemail, esid);
	/*	Euser euser = (Euser) session.getAttribute("user");
		int index = -1;
		for (int i = 0; i < list.getErelations().size(); i++) {
			if (list.getErelations().get(i).getEuser().getUid() == euser.getUid()) {
				index = i;
				break;
			}
		}

		if (index != -1) {
			list.getErelations().remove(index);
		}*/
		return list;
		
	}
	@RequestMapping("getUser")
	@ResponseBody
	public List<Euser> getUser(Euser euser) {
		return euserMapper.queryUser(euser);
	}
	@RequestMapping("Gc")
	public String Gc(){
		return "/WEB-INF/view/Gc.jsp";
	}
	@RequestMapping("Text")
	public String Text(){
		return "/WEB-INF/view/Text.jsp";
	}
	
	@RequestMapping("GetPage")
	@ResponseBody
	public PageBean GetPage(Integer begin,
			Integer size,String title,Integer efid,Integer emailstatus,
			HttpSession session){
		if(size==null) {
			size = 3;
		}
		if(begin==null) {
			size = 1;
		}

		System.out.println("-------------------------------------------------------"+emailstatus);
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
		List<Erelation> data = erelationService.queryAll((begin-1)*size, size,uid,title,efid,emailstatus);
		int max = erelationService.queryCount(uid,title,efid,emailstatus);
		PageBean source = new PageBean(begin, size, max, data);
		return source;
	}
	//新建文件夹
	@RequestMapping("insertFolder")
	@ResponseBody
	public String insertFolder(String foldername,HttpSession session){
		Integer uid = Integer.parseInt(session.getAttribute("uid").toString());
		efolderService.insertFolder(uid, foldername);
		return  "1";
	};
	//移动文件夹
	@RequestMapping("MoveFolder")
	@ResponseBody
	public String MoveFolder(Integer efid,Integer[] chk_value){
		if (chk_value == null && chk_value.length <= 0) {
            return "2";
        }
		Efolder ss = new Efolder();
		ss.setEfid(efid);
		ss.setList(chk_value);
		efolderService.updateEfolder(ss);
		return  "1";
	};
	//垃圾箱
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer[] chk_value){
		if (chk_value == null && chk_value.length <= 0) {
            return "1";
        }
        //直接传数组
		for (Integer integer : chk_value) {
			System.out.println(integer);
		}
       erelationService.delete(chk_value);
		return  "2";
	};
	//已读
	@RequestMapping("yidu")
	@ResponseBody
	public String yidu(Integer[] chk_value){
		if (chk_value == null && chk_value.length <= 0) {
            return "1";
        }
        //直接传数组
       erelationService.yidu(chk_value);
		return  "2";
	};
	//未读
	@RequestMapping("weidu")
	@ResponseBody
	public String weidu(Integer[] chk_value){
		if (chk_value == null && chk_value.length <= 0) {
			map.put("msg", "未选择！");
            return "1";
        }
        //直接传数组
		erelationService.weidu(chk_value);
		return  "2";
	};
}
