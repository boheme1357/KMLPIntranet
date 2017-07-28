package org.KMLP.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.KMLP.domain.DocumentVO;
import org.KMLP.persistence.DocumentDAO;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Inject
	DocumentDAO dao;

	// 01. 일일업무일지목록
	@Override
	public List<DocumentVO> selectAll() {

		return dao.selectAll();
	}

	// 02_02. 일일업무일지데이터삽입
	@Override
	public void insert(DocumentVO vo) {

		dao.insert(vo);
	}

	// 03.일일업무일지내용조회
	@Override
	public DocumentVO selectContent(String d_num) {
		return dao.selectContent(d_num);
	}

	// 04. 일일업무일지수정
	@Override
	public void update(DocumentVO vo) {
		dao.update(vo);
	}

	// 05. 일일업무일지삭제
	@Override
	public void delete(String d_num) {
		dao.delete(d_num);
	}

	// 06. 일일업무일지 미결된 서류 넘버
	@Override
	public HashMap selectUnapproveDoc(String m_id) {
		// db에서 final_check != true 인 문서 중 a_check != true인 문서번호를 검색해서 가져옴
		
		return null;
	}



	

}
