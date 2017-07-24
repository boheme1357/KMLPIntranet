package org.KMLP.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.KMLP.domain.DocumentVO;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	private static final String namespace="documentMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	//01. 일일업무일지 전체목록
	@Override
	public List<DocumentVO> selectAll() {
		return sqlSession.selectList(namespace+".selectAll");
	}

	//02_02. 일일업무일지 데이터삽입
	@Override
	public void insert(DocumentVO vo) {
		sqlSession.insert(namespace+".insert", vo);
	}

	
	//03. 일일업무일지 내용조회
	@Override
	public DocumentVO selectContent(String d_num) {
		return sqlSession.selectOne(namespace+".selectContent", d_num);
	}

	//04. 일일업무일지 수정
	@Override
	public void update(DocumentVO vo) {
		sqlSession.update(namespace+".update", vo);
	}
	
	
	//05. 일일업무일지 삭제
		@Override
		public void delete(String d_num) {
			sqlSession.delete(namespace+".delete", d_num);
		}

		
	
	

												
	
	
	
	

}
