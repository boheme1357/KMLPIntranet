package org.KMLP.service;

import java.util.HashMap;
import java.util.List;

import org.KMLP.domain.ApproveVO;
import org.KMLP.domain.DocumentVO;

public interface DocumentService {
	// 01. 일일업무일지 목록
	public List<DocumentVO> selectAll();

	// 02_02. 일일업무일지 데이터삽입
	public void insert(DocumentVO vo, ApproveVO avo);

	// 03. 일일업무일지 내용조회
	public DocumentVO selectContent(String d_num);

	// 04. 일일업무일지 수정
	public void update(DocumentVO vo);

	// 05. 일일업무일지 삭제
	public void delete(String d_num);

	// 06-01. 발신한 결재서류 리스트(진행중)
	public List<DocumentVO> selectSendListAll_ing(String d_id);

	// 06-02. 발신한 결재서류 리스트(완료)
	public List<DocumentVO> selectSendListAll_end(String d_id);

	// 07-01. 수신한 결재서류 리스트(진행중)
	public List<DocumentVO> selectReceiveListAll_ing(String d_id);

	// 07-01. 수신한 결재서류 리스트(완료)
	public List<DocumentVO> selectReceiveListAll_end(String d_id);

	// 08. 발신한 결재서류 리스트(반려)
	public List<DocumentVO> selectSendListAll_return(String d_id);

	// 09. 미결된 서류 넘버 Map
	public HashMap<String, Boolean> selectUnapproveDoc(String a_id);

	public void update_now_cnt(String d_num, int d_now_cnt);

	public void update_final_condition(String d_num);

}
