package egovframework.com.studentMng.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.studentMng.service.StudentMngService;

@Controller
public class StudentMngController {
	
	@Resource(name="StudentMngService")
	private StudentMngService studentMngService;
	
	@RequestMapping("/studentMng/getStudentMngList.do")
	public String getStudentMngList() {
		return "studentMng/studentMngList";
	}
	
	@RequestMapping("/studentMng/selectStudentMngList.do")
	public ModelAndView selectStudentMngList() {
		ModelAndView mv = new ModelAndView();
		
		List<HashMap<String, Object>> list = studentMngService.selectStudentMngList();
		
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/studentMng/getStudentMngInfo.do")
	public ModelAndView getStudentMngInfo(@RequestParam(name="studentId") int studentId) {
		ModelAndView mv = new ModelAndView();
		
		HashMap<String, Object> studentInfo = studentMngService.selectStudentMngInfo(studentId);
		mv.addObject("studentInfo", studentInfo);
		mv.setViewName("studentMng/studentMngInfo");
		
		return mv;
	}
}
