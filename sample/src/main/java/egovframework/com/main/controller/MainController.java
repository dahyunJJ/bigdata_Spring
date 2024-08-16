package egovframework.com.main.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name="MainService")
	private MainService mainService;

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/main/student.do")
	public ModelAndView student() {
		ModelAndView mv = new ModelAndView("main/student");
		
		List<HashMap<String, Object>> list = mainService.selectStudentInfo();

		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping("/main/score.do")
	public ModelAndView score() {
		ModelAndView mv = new ModelAndView("main/score");
		
		List<HashMap<String, Object>> list = mainService.selectStudentScore();

		mv.addObject("list", list);
		
		return mv;
	}
	
	// 메소드에서 HttpServletRequest 사용하기
	@RequestMapping("/sessionTest.do")
	public ModelAndView sessionTest(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		
		HttpSession session = request.getSession(false);
		if(session == null) {
			System.out.println("최초방분");
		} else {
			String sessionId = session.getId();
			System.out.println("세선 ID : " + sessionId);
		}
		
		return mv;
	}
	
	// 메소드에서 HttpSession 사용하기 - session 객체가 생성된 후 유지되는지
	@RequestMapping("/sessionNumberTest.do")
	public ModelAndView sessionNumberTest(HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		
		Integer randomNumber = (Integer) session.getAttribute("random-number");
		if(randomNumber == null) {
			Integer generated = new Random().nextInt();
			System.out.println("generate-random-number : " + generated.toString());
			session.setAttribute("random-number", generated);
		} else { 
			System.out.println("my random-number : " + randomNumber.toString());
		}
		
		return mv;
	}
	
	// 쿠키 저장하기
	@RequestMapping("/cookieTest.do")
	public ModelAndView cookieTest(HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView("main");
		
		//Cookie cookie = new Cookie("message", "from_main"); // 기본적으로 공백, 특수문자(=,"/?@:;), 한글 사용 불가
		Cookie cookie = new Cookie("message", URLEncoder.encode("from main", "UTF-8"));
		response.addCookie(cookie);
		
		return mv;
	}

}
