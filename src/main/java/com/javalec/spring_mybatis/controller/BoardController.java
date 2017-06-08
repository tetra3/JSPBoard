package com.javalec.spring_mybatis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_mybatis.dao.IDao;

@Controller
public class BoardController {
	
//	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Autowired
	private SqlSession sqlSession;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	@RequestMapping("/bbs")
	public String bbs(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("list", dao.listDao());
		System.out.println("¿©±â°¡ bbs");
		
		return "/bbs";
	}
	
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model, HttpSession session) {
		IDao dao = sqlSession.getMapper(IDao.class);
		String id ="";
		id = (String)session.getAttribute("id");
		dao.writeDao(id, request.getParameter("bTitle"), request.getParameter("bContent"));
		return "redirect:bbs";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model, HttpSession session) {
		IDao dao = sqlSession.getMapper(IDao.class);
//		dao.deleteDao(request.getParameter("bId"));
		String boardID = (dao.contentView(request.getParameter("bId")).get(0).getbName());		
		String userId = (String)session.getAttribute("id");
		int judge = 1;
		
		
		if(boardID.equals(userId)) {
			dao.deleteDao(request.getParameter("bId"));
			judge = 1;
			return "redirect:bbs";
		}
		else{
			judge = 0;
			return "/cannotdelete";
		}
		
		
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model){
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.upHit(request.getParameter("bId"));
		
		
		model.addAttribute("content_view", dao.contentView(request.getParameter("bId")));
		System.out.println("content_view");
		
		return "content_view";
	}
	
	@RequestMapping("/revise")
	public String revise_view(HttpServletRequest request, Model model){
		IDao dao = sqlSession.getMapper(IDao.class);
		
		model.addAttribute("content_view", dao.contentView(request.getParameter("bId")));
		System.out.println("revise_view");
		
		return "/revise_view";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST )
	public String modify(HttpServletRequest request, Model model){
		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.modifyDao(request.getParameter("bId"), request.getParameter("bTitle"), request.getParameter("bContent"));
		
		System.out.println("modify()");
		System.out.println(request.getParameter("bId"));
		System.out.println(request.getParameter("bTitle"));
		System.out.println(request.getParameter("bContent"));
		

		return "redirect:bbs";
	}
	
	@RequestMapping(value="/reply_view")
	public String replyView(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		model.addAttribute("reply_view",dao.replyViewDao(request.getParameter("bId")));
		
		
		return "/reply_view";
	}
	
	@RequestMapping(value="/reply")
	public String reply(HttpServletRequest request, Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		int a = Integer.parseInt(request.getParameter("bStep"))+1;
		int b = Integer.parseInt(request.getParameter("bIndent"))+1;
		String bStep = Integer.toString(a);
		String bIndent = Integer.toString(b);
		
		dao.replyDao(request.getParameter("bName"), 
				request.getParameter("bTitle"), request.getParameter("bContent"),
				request.getParameter("bGroup"), bStep, bIndent );
		
		return "redirect:bbs";
	}
	
	
	
}
