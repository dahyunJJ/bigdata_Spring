package egovframework.com.school.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("SchoolDAO")
public class SchoolDAO extends EgovAbstractMapper{
	
	public List<HashMap<String, Object>> selectSchoolList() {
		return selectList("selectSchoolList");
	}
	
	public HashMap<String, Object> selectSchoolInfo(int schoolIdx) {
		return selectOne("selectSchoolInfo", schoolIdx);
	}
	
	public int insertSchoolInfo(HashMap<String, Object> paramMap) {
		return insert("insertSchoolInfo", paramMap); 
		// MyBatis : id는 InsertSchoolInfo이고, 파라미터는 paramMap인 insert 태그를 찾아라
	}

	public int deleteSchoolInfo(HashMap<String, Object> paramMap) {
		return delete("deleteSchoolInfo", paramMap);
	}
}
