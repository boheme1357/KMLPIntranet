package org.KMLP.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import org.KMLP.domain.DocumentVO;
import org.KMLP.persistence.DocumentDAO;
import org.springframework.stereotype.Service;
import java.util.HashMap;

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
		// 결재 횟수만큼 approve 테이블에 행을 추가하는 로직이 추가되어야 함
		// DB 결과: document 테이블에 1행 추가 + approve 테이블에 결재횟수만큼 행 추가
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

	// 06. 발신한 결재서류 리스트
	@Override
	public List<DocumentVO> selectSentListAll(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectSentListAll(d_id);
	}

	// 07. 수신한 결재서류 리스트
	@Override
	public List<DocumentVO> selectReceiveListAll(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectReceiveListAll(d_id);
	}

	// 08. 미결된 서류 넘버 Map
	@Override
	public HashMap<String, Boolean> selectUnapproveDoc(String m_id) {
		// db에서 final_check != true 인 문서 중 a_check != true인 문서번호를 검색해서 가져옴
		
		HashMap<String, Boolean> unapprDocMap = new HashMap<String, Boolean>();
	
		return dao.selectUnapproveDoc(unapprDocMap, m_id);
	}

}
