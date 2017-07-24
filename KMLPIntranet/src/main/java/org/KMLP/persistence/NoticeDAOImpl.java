package org.KMLP.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.KMLP.domain.MemberVO;
import org.KMLP.domain.NoticeVO;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	private static final String namespace="noticeMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	//01. 공지사항전체목록
	@Override
	public List<NoticeVO> selectAll() {
		return sqlSession.selectList(namespace+".selectAll");
	}

	//02_02. 공지사항데이터삽입
	@Override
	public void insert(NoticeVO vo) {
		sqlSession.insert(namespace+".insert", vo);
	}

	
	//03. 공지사항내용조회
	@Override
	public NoticeVO selectContent(String n_num) {
		return sqlSession.selectOne(namespace+".selectContent", n_num);
	}

	//04. 공지사항수정
	@Override
	public void update(NoticeVO vo) {
		sqlSession.update(namespace+".update", vo);
	}
	
	
	//05. 공지사항삭제
		@Override
		public void delete(String n_num) {
			sqlSession.delete(namespace+".delete", n_num);
		}

		
	
	

												
	
	
	
	

}
