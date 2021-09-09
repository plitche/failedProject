package com.project.resignation.daoImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.resignation.dao.TestDao;

@Service
public class TestDaoImpl implements TestDao {
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public int testServiceMethod1() throws SQLException {
		return sqlsession.selectOne("test.testDbProcedure2");
	}
	
}
