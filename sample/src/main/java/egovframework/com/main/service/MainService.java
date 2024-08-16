package egovframework.com.main.service;

import java.util.HashMap;
import java.util.List;

public interface MainService {
	
	List<HashMap<String, Object>> selectStudentInfo();
	List<HashMap<String, Object>> selectStudentScore();

}
