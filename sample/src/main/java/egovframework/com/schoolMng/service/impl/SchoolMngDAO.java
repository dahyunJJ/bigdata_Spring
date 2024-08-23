package egovframework.com.schoolMng.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("SchoolMngDAO")
public class SchoolMngDAO extends EgovAbstractMapper{
	
	public List<HashMap<String, Object>> selectSchoolList(){
		return selectList("selectSchoolMngList");
	}
	
	public HashMap<String, Object> selectSchoolInfo(int schoolIdx){
		return selectOne("selectSchoolMngInfo", schoolIdx);
	}

	public int insertSchoolInfo(HashMap<String, Object> paramMap) {
		return insert("insertSchoolMngInfo", paramMap);
	}

	public int deleteSchoolInfo(HashMap<String, Object> paramMap) {
		return delete("deleteSchoolMngInfo", paramMap);
	}

	public int updateSchoolInfo(HashMap<String, Object> paramMap) {
		return update("updateSchoolMngInfo", paramMap);
	}

}
