package com.javalec.spring_mybatis.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.spring_mybatis.dao.IDao;

@Controller
public class LoginController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/main")
	public String view() {
		
		return "/main";
	}
	
	@RequestMapping(value={"/","/index"})
	public String login(Model model) {
//		IDao dao = sqlSession.getMapper(IDao.class);
//		model.addAttribute("list", dao.listDao());
		
		return "/home";
	}
	
	@RequestMapping(value={"/home","loginView"})
	public String home(Model model) {

		
		return "/home";
	}
	
	@RequestMapping(value="/signupView")
	public String registerView() {
		return "/join";
	}
	
	@RequestMapping(value="/signup")
	public String register(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.singupDao(request.getParameter("userNameSignUp"),
				request.getParameter("userIdSignUp"),
				request.getParameter("passwordSignUp"),
				request.getParameter("passwordSignUp_Confirm"));
		
		return "/home";
	}
	
	@RequestMapping(value="/login")
	public String loginconfirm(HttpServletRequest request, Model model, HttpSession session) {
		
		List<Map<String,String>> test = sqlSession.selectList("loginconfirmDao",request.getParameter("userID"));
		int x = -1;
		
		if(test.isEmpty()) {
			x=-1; // 테이블이 비었으므로 일치하는 아이디가 없음		
		}
		else{
			Map<String, String> map;
			map = test.get(0);
			if(map.get("LPASSWORD").equals(request.getParameter("userPassword"))) {
				x=1; // 테이블에서도 검색이 되고 비밀번호 까지 일치하므로 아이디 비번 확인 완료
				
				
			}
			else{
				x=-1; // 테이블에서 검색이 되나 비밀번호가 일치하지 않음 따라서 비밀번호 불일치
			}
		}
		
		if(x == 1) {
			
			session.setAttribute("id", request.getParameter("userID"));
			return "redirect:main";
		}
		else{
			return "/pleasecheck";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "/logout";
	}
	
	

}



