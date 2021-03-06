package org.KMLP.service;

import java.util.List;

import javax.inject.Inject;

import org.KMLP.domain.MemberVO;
import org.KMLP.domain.Member_SignimgVO;
import org.KMLP.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	// 01. 사원전체목록
	@Override
	public List<MemberVO> selectAll() {

		return dao.selectAll();
	}

	// 02_02. 사원데이터삽입
	@Override
	public void insert(MemberVO vo) {

		dao.insert(vo);
	}

	// 03. 사원개인정보조회
	@Override
	public MemberVO selectContent(String m_id) {
		return dao.selectContent(m_id);
	}

	// 04. 사원정보수정
	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
	}

	// 05. 사원정보삭제
	@Override
	public void delete(String m_id) {
		dao.delete(m_id);
	}

	// 06. 비밀번호체크
	@Override
	public boolean checkPw(String m_id, String m_pwd) {
		return dao.checkPw(m_id, m_pwd);
	}

	//07. 도장 이미지 조회
	@Override
	public List<Member_SignimgVO> selectSignImgList(String d_num) {
		// TODO Auto-generated method stub
		return dao.selectSignImgList(d_num);
	}

	//08.멤버 부서 조회
	@Override
	public String selectDept(String m_id) {
		return dao.selectDept(m_id);
		
	}
	
	// 09. 비밀번호찾기/사번, 이메일확인
	@Override
	public MemberVO selectFindPw(String m_id, String m_email_id, String m_email_do) {
	
		return  dao.selectFindPw(m_id, m_email_id, m_email_do);
	}
	
	// 10. 임시비밀번호로변경
	@Override
	public void updateTempPw(String m_id, String m_pwd) {
		
		dao.updateTempPw(m_id, m_pwd);
	}
	

}
