package com.project.resignation.daoImpl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.resignation.dao.TestDao;

@Repository
public class TestDaoImpl implements TestDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int testDbProcedure2() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Test.testDbProcedure2");
	}

}
