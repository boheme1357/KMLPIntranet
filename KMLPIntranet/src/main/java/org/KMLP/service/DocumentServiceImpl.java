package org.KMLP.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.KMLP.domain.DocumentVO;
import org.KMLP.persistence.DocumentDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Inject
	DocumentDAO dao;

	@Inject
	ApproveService approveService;

	// 01. 일일업무일지목록
	@Override
	public List<DocumentVO> selectAll() {

		return dao.selectAll();
	}

	// 02_02. 일일업무일지데이터삽입
	@Override
	public void insert(DocumentVO vo, ApproveVO avo) {

		// document 행추가
		dao.insert(vo);

		avo.setA_num(vo.getD_num());

		// d_final_cnt 만큼 approve 행 추가
		approveService.insert(avo);

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

	// 06-01. 발신한 결재서류 리스트(진행중)
	@Override
	public List<DocumentVO> selectSendListAll_ing(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectSendListAll_ing(d_id);
	}

	// 06-02. 발신한 결재서류 리스트(완료)
	@Override
	public List<DocumentVO> selectSendListAll_end(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectSendListAll_end(d_id);
	}

	// 07-01. 수신한 결재서류 리스트(진행중)
	@Override
	public List<DocumentVO> selectReceiveListAll_ing(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectReceiveListAll_ing(d_id);
	}

	// 07-01. 수신한 결재서류 리스트(완료)
	@Override
	public List<DocumentVO> selectReceiveListAll_end(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectReceiveListAll_end(d_id);
	}

	// 08. 발신한 결재서류 리스트(반려)
	@Override
	public List<DocumentVO> selectSendListAll_return(String d_id) {
		// TODO Auto-generated method stub
		return dao.selectSendListAll_return(d_id);
	}

	// 08. 미결된 서류 넘버 Map
	@Override
	public HashMap<String, Boolean> selectUnapproveDoc(String m_id) {
		// db에서 final_check != true 인 문서 중 a_check != true인 문서번호를 검색해서 가져옴

		HashMap<String, Boolean> unapprDocMap = new HashMap<String, Boolean>();

		return dao.selectUnapproveDoc(unapprDocMap, m_id);
	}

}
