package org.KMLP.service;

import java.util.List;

import org.KMLP.domain.MemberVO;
import org.KMLP.domain.NoticeVO;

public interface NoticeService {
	
	
	
	/*//01. 공지사항목록  ---> 페이징처리로 변경
	public List<NoticeVO> selectAll();
	*/
	
	
	/*페이징처리관련시작*/
	
	// 01 전체개수
	public int selectTotalCnt();

	// 02 한페이지에 표시할 목록
	public List<NoticeVO> selectBetween(int start, int end);

	// 03. 글 조회횟수
	public void updateViewCnt(int n_num);
	
	/*페이징처리관련끝*/
	
		
	
	
	
	//02_02. 공지사항데이터삽입
	public void insert(NoticeVO vo);
	
	//03. 공지사항내용조회
	public NoticeVO selectContent(int n_num);
	
	
	//04. 공지사항수정
	public void update(NoticeVO vo);
	
	//05. 공지사항삭제
	public void delete(int n_num);
	
	
	
}
