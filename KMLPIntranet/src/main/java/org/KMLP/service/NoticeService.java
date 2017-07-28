package org.KMLP.service;

import java.util.List;

import org.KMLP.domain.MemberVO;
import org.KMLP.domain.NoticeVO;

public interface NoticeService {
	//01. 공지사항목록
	public List<NoticeVO> selectAll();
	
	//02_02. 공지사항데이터삽입
	public void insert(NoticeVO vo);
	
	//03. 공지사항내용조회
	public NoticeVO selectContent(String n_num);
	
	
	//04. 공지사항수정
	public void update(NoticeVO vo);
	
	//05. 공지사항삭제
	public void delete(String n_num);
	
	
	
}
