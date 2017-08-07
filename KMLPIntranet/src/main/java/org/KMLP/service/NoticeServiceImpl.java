package org.KMLP.service;

import java.util.List;

import javax.inject.Inject;
import org.KMLP.domain.NoticeVO;
import org.KMLP.persistence.NoticeDAO;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO dao;

	/*// 01. 공지사항목록-------> 페이징처리로 변경
	@Override
	public List<NoticeVO> selectAll() {

		return dao.selectAll();
	}*/
	

	/*페이징처리관련시작*/
	
	//01 전체개수
	@Override
	public int selectTotalCnt() {
		return dao.selectTotalCnt();
	}


	//02 한페이지에 표시할 목록
	@Override
	public List<NoticeVO> selectBetween(int start, int end) {
		return dao.selectBetween(start, end);
	}

	//03. 글조회횟수
	
	
	@Override
	
	public void updateViewCnt(int n_num) {
		
		
        	dao.updateViewCnt(n_num);
        	
    
		
		
	}
	
	/*페이징처리관련끝*/
	
	
	
	

	// 02_02. 공지사항데이터삽입
	@Override
	public void insert(NoticeVO vo) {

		dao.insert(vo);
	}

	// 03. 공지사항내용조회
	@Override
	public NoticeVO selectContent(int  n_num) {
		return dao.selectContent(n_num);
	}

	// 04. 공지사항수정
	@Override
	public void update(NoticeVO vo) {
		dao.update(vo);
	}

	// 05. 공지사항삭제
	@Override
	public void delete(int  n_num) {
		dao.delete(n_num);
	}



	

}
