package org.KMLP.persistence;

import java.util.List;

import org.KMLP.domain.MemberVO;
import org.KMLP.domain.DocumentVO;

public interface DocumentDAO {
	
	//01. 일일업무일지 전체목록
	public List<DocumentVO> selectAll();
	
	
	//02_02. 일일업무일지 데이터삽입
	public void insert(DocumentVO vo);
	
	//03. 일일업무일지 내용조회
	public DocumentVO selectContent(String n_num);
	
	
	//04. 일일업무일지 
	public void update(DocumentVO vo);
	
	//05. 일일업무일지 
	public void delete(String n_num);



	
	
	
}
