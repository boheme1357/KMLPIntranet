package org.KMLP.persistence;

import java.util.List;

import javax.inject.Inject;


import org.KMLP.domain.ApproveVO;
import org.KMLP.domain.Approve_ReturnVO;
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



	@Override
	public void update_condition(ApproveVO avo) {
		sqlSession.update(namespace + ".update_condition", avo);
		
	}



	@Override
	public void insert_approve_return(Approve_ReturnVO arvo) {
		sqlSession.insert(namespace + ".insert_return", arvo);
		
	}



	@Override
	public String update_return_cnt(ApproveVO avo) {
		sqlSession.update(namespace + ".update_return_cnt", avo);
		int tmpReturnCnt = sqlSession.selectOne(namespace + ".select_return_cnt", avo);
		String ar_return_cnt = Integer.toString(tmpReturnCnt);
		
		return ar_return_cnt;
	}



	@Override
	public List<Approve_ReturnVO> selectReturnListAll(String ar_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectReturnListAll", ar_num);
	}

}
