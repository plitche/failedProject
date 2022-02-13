package com.project.resignation.testServiceImpl;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.resignation.testService.TestService;

@Service("testService")
public class TestServiceImpl implements TestService {
	
	@Autowired(required=true)
	TestDao testDao;
	
	@Override
	public Map<Object, Object> testServiceMethod1() throws SQLException {
		Map<Object, Object> testMap = testDao.testDbProcedure2();
		return testMap;
	}
	
}
