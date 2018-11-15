package com.accp.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {

	
	@RequestMapping("/fileUpload")
	public String fileUpload(@RequestParam("files") MultipartFile [] files,HttpSession session,String content) {
		String fileUrl = session.getServletContext().getRealPath("/static/fileUpload");
		System.out.println(fileUrl);
		System.out.println(files);
		for(MultipartFile f:files) {
			String suffix = f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf("."),f.getOriginalFilename().length());
			System.out.println(suffix);
			String uid = UUID.randomUUID().toString();
			File file = new File(fileUrl+"/"+uid+suffix);
			try {
				f.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping("toFileUpload")
	public String toFileUpload() {
		return "qzone-new";
	}
	
	
}
