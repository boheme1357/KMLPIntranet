package org.KMLP.service;

import java.util.List;

import javax.inject.Inject;
import org.KMLP.domain.NoticeVO;
import org.KMLP.persistence.NoticeDAO;
import org.springframework.stereotype.Service;

@Service
public class NoticeSeriveImpl implements NoticeSerive {

	@Inject
	NoticeDAO dao;

	// 01. 공지사항목록
	@Override
	public List<NoticeVO> selectAll() {

		return dao.selectAll();
	}

	// 02_02. 공지사항데이터삽입
	@Override
	public void insert(NoticeVO vo) {

		dao.insert(vo);
	}

	// 03. 공지사항내용조회
	@Override
	public NoticeVO selectContent(String m_id) {
		return dao.selectContent(m_id);
	}

	// 04. 공지사항수정
	@Override
	public void update(NoticeVO vo) {
		dao.update(vo);
	}

	// 05. 공지사항삭제
	@Override
	public void delete(String m_id) {
		dao.delete(m_id);
	}



	

}
