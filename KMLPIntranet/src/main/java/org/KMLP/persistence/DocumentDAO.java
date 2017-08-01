package org.KMLP.persistence;

import java.util.HashMap;
import java.util.List;

import org.KMLP.domain.MemberVO;
import org.springframework.transaction.annotation.Transactional;
import org.KMLP.domain.DocumentVO;

@Transactional
public interface DocumentDAO {
	
	//01. 일일업무일지 전체목록
	public List<DocumentVO> selectAll();
	
	
	//02_02. 일일업무일지 데이터삽입
	@Transactional
	public void insert(DocumentVO vo);
	
	//03. 일일업무일지 내용조회
	public DocumentVO selectContent(String n_num);
	
	
	//04. 일일업무일지 
	public void update(DocumentVO vo);
	
	//05. 일일업무일지 
	public void delete(String n_num);

	// 06. 발신한 결재서류 리스트
	public List<DocumentVO> selectSentListAll(String d_id);
	
	// 07. 수신한 결재서류 리스트
	public List<DocumentVO> selectReceiveListAll(String d_id);
	
	// 08. 미결된 서류 넘버 Map
	public HashMap<String, Boolean> selectUnapproveDoc(HashMap<String, Boolean> unapprDocMap, String m_id);



	
	
	
}
