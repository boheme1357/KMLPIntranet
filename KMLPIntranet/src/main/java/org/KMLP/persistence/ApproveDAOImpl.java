package org.KMLP.persistence;

import javax.inject.Inject;


import org.KMLP.domain.ApproveVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ApproveDAOImpl implements ApproveDAO {
	
	private static final String namespace = "approveMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	

	@Override
	public void insert(ApproveVO avo) {
		for(int i=0 ; i < avo.getA_id_arr().length ; i++) {
			
			avo.setA_id(avo.getA_id_arr()[i]);
			avo.setA_cnt(i+1);
			
			sqlSession.insert(namespace + ".insert", avo);
		}
	}

}
