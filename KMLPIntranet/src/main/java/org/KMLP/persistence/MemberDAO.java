package org.KMLP.persistence;

import java.util.List;

import org.KMLP.domain.MemberVO;
import org.KMLP.domain.Member_SignimgVO;

public interface MemberDAO {
	
	//01. 사원전체목록
	public List<MemberVO> selectAll();
	
	
	//02_02. 사원데이터삽입
	public void insert(MemberVO vo);
	
	//03. 사원개인정보조회
	public MemberVO selectContent(String m_id);
	
	
	//04. 사원정보수정
	public void update(MemberVO vo);
	
	//05. 사원정보삭제
	public void delete(String m_id);
	
	//06. 비밀번호체크
	public boolean checkPw(String m_id, String m_pwd);

	//07. 도장 이미지 조회
	public List<Member_SignimgVO> selectSignImgList(String d_num);

	//08.멤버 부서 조회
	public String selectDept(String m_id);
	
}
