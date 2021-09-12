package com.project.resignation.testServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.resignation.dao.TestDao;
import com.project.resignation.testService.TestService;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired(required=true)
	TestDao testDao;
	
	@Override
	public int testServiceMethod1() throws Exception {
		return testDao.testServiceMethod1();
	}
	
}
