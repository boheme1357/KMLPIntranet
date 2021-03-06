package org.KMLP.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.KMLP.domain.MemberVO;
import org.KMLP.domain.Member_SignimgVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final String namespace = "memberMapper";

	@Inject
	private SqlSession sqlSession;

	// 01. 사원전체목록
	@Override
	public List<MemberVO> selectAll() {
		return sqlSession.selectList(namespace + ".selectAll");
	}

	// 02_02. 사원데이터삽입
	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(namespace + ".insert", vo);
		sqlSession.insert(namespace + ".insertAuthority", vo);

		try {
			System.out.println("-----insertSignImg------------------");
			sqlSession.insert(namespace + ".insertSignImg", vo);

		} catch (NullPointerException e) {
			System.out.println("도장 이미지 미등록 ...........");
			return;
		}

	}

	// 03. 사원개인정보조회
	@Override
	public MemberVO selectContent(String m_id) {
		MemberVO vo = sqlSession.selectOne(namespace + ".selectContent", m_id);
		vo.setMs_img(sqlSession.selectOne(namespace + ".selectSignImg", m_id));
		return vo;
	}

	// 04. 사원정보수정
	@Override
	public void update(MemberVO vo) {
		sqlSession.update(namespace + ".update", vo);
		try {
			System.out.println("-----insertSignImg------------------");
			sqlSession.update(namespace + ".updateSignImg", vo);

		} catch (NullPointerException e) {
			System.out.println("도장 이미지 미등록 ...........");
			return;
		}
	}

	// 05. 사원정보삭제
	@Override
	public void delete(String m_id) {
		sqlSession.delete(namespace + ".delete", m_id);
	}

	// 06. 비밀번호체크
	@Override
	public boolean checkPw(String m_id, String m_pwd) {

		boolean result = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pwd", m_pwd);

		int count = sqlSession.selectOne(namespace + ".checkPw", map);

		if (count == 1)
			result = true;

		return result;
	}

	//07. 도장 이미지 조회
	@Override
	public List<Member_SignimgVO> selectSignImgList(String d_num) {
		return sqlSession.selectList(namespace + ".selectSignImgList", d_num);
	}

	//08.멤버 부서 조회
	@Override
	public String selectDept(String m_id) {
		return sqlSession.selectOne(namespace + ".selectDept", m_id);
	}
	
	
	
	//09. 비밀번호찾기/사번, 이메일확인
	@Override
	public MemberVO selectFindPw(String m_id, String m_email_id, String m_email_do) {
		
		System.out.println("m_id1" +  m_id);
		System.out.println("m_id1" +  m_email_id);
		System.out.println("m_id1" +  m_email_do);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_email_id", m_email_id);
		map.put("m_email_do", m_email_do);
		
		return  sqlSession.selectOne(namespace+".selectFindPw", map);
	}

	//10. 임시비밀번호로변경
	@Override
	public void updateTempPw(String m_id, String m_pwd) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pwd", m_pwd);
		
		sqlSession.update(namespace+".updateTempPw", map);


}
}
