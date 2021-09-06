package com.project.resignation.testServiceImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.resignation.testService.TestService;

@Service
public class TestServiceImpl implements TestService {
	
	
	@Autowired
	SqlSession sqlsession;
	
	
	@Override
	public int testServiceMethod1() throws Exception {
		
		return sqlsession.selectOne("Test.testDbProcedure2");
	}

}
