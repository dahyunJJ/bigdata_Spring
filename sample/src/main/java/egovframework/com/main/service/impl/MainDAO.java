package egovframework.com.main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("MainDAO") // Repository : xml 파일과 연결해주는 명칭
public class MainDAO extends EgovAbstractMapper{
// EgovAbstractMapper : mybatis와 연결
	
	public List<HashMap<String, Object>> selectStudentInfo() {
		return selectList("selectStudentInfo");
	}
	
	public List<HashMap<String, Object>> selectStudentScore() {
		return selectList("selectStudentScore");
	}
}
