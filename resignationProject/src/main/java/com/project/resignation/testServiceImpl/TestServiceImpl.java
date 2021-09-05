package com.project.resignation.testServiceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.resignation.dao.TestDao;
import com.project.resignation.testService.TestService;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	TestDao testDao;
	
	@Override
	public int testServiceMethod1() throws Exception {
		
		return testDao.testDbProcedure2();
	}
	
}
