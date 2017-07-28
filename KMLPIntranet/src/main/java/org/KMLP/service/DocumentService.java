package org.KMLP.service;

import java.util.HashMap;
import java.util.List;


import org.KMLP.domain.DocumentVO;

public interface DocumentService {
	//01. 일일업무일지 목록
	public List<DocumentVO> selectAll();
	
	//02_02. 일일업무일지 데이터삽입
	public void insert(DocumentVO vo);
	
	//03. 일일업무일지 내용조회
	public DocumentVO selectContent(String d_num);
	
	
	//04. 일일업무일지 수정
	public void update(DocumentVO vo);
	
	//05. 일일업무일지 삭제
	public void delete(String d_num);
	
	//06. 일일업무일지 미결된 서류 넘버
	public HashMap selectUnapproveDoc(String m_id);
	
	
	
}
