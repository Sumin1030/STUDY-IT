/*=========================
 JoinController.java
==========================*/
package com.studyit.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class JoinAjaxController {

	@Autowired
	IJoinAjaxDAO service;
	
	/*
	@RequestMapping(value ="/signUpPage.do")
	public String signUpPage(){
		
		return "signUp";
	}
	
	@RequestMapping(value = "/signUp.do")
	public String signUp(MemberDTO dto) {
		
		service.idCheck(id);
		
		return "login";
	}*/
	
	//produces는 ajax가 데이터 넘겨받을때 깨짐 방지
	@RequestMapping(value = "/idcheck.action", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(HttpServletRequest request) throws Exception {
		
		String id = request.getParameter("id");
		int result=service.idCheck(id);
		return Integer.toString(result);
	}
	
}
   
   
  
   
   
   
