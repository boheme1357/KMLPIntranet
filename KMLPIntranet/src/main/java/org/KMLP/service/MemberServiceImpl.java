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

	@Override
	public List<Member_SignimgVO> selectSignImgList(String d_num) {
		// TODO Auto-generated method stub
		return dao.selectSignImgList(d_num);
	}

}
