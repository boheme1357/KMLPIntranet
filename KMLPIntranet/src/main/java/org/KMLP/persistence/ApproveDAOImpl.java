package org.KMLP.persistence;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.apache.ibatis.session.SqlSession;

public class ApproveDAOImpl implements ApproveDAO {
	
	private static final String namespace = "approveMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	

	@Override
	public void insert(ApproveVO avo, String d_num) {
		sqlSession.insert(namespace + ".insert", avo);
		
	}

}
