package org.KMLP.persistence;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.KMLP.domain.DocumentVO;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	private static final String namespace = "documentMapper";

	@Inject
	private SqlSession sqlSession;

	// 01. 일일업무일지 전체목록
	@Override
	public List<DocumentVO> selectAll() {
		return sqlSession.selectList(namespace + ".selectAll");
	}

	// 02_02. 일일업무일지 데이터삽입
	@Override
	public void insert(DocumentVO vo) {
		sqlSession.insert(namespace + ".insert", vo);
	}

	// 03. 일일업무일지 내용조회
	@Override
	public DocumentVO selectContent(String d_num) {
		return sqlSession.selectOne(namespace + ".selectContent", d_num);
	}

	// 04. 일일업무일지 수정
	@Override
	public void update(DocumentVO vo) {
		sqlSession.update(namespace + ".update", vo);
	}

	// 05. 일일업무일지 삭제
	@Override
	public void delete(String d_num) {
		sqlSession.delete(namespace + ".delete", d_num);
	}

	// 06. 발신한 결재서류 리스트
	@Override
	public List<DocumentVO> selectSentListAll(String d_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectSentListAll", d_id);
	}

	// 07. 수신한 결재서류 리스트
	@Override
	public List<DocumentVO> selectReceiveListAll(String d_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectReceiveListAll", d_id);
	}

	// 08. 미결된 서류 넘버 Map
	@Override
	public HashMap<String, Boolean> selectUnapproveDoc(HashMap<String, Boolean> unapprDocMap, String m_id) {
	
		List<HashMap> tmpOutput = sqlSession.selectList(namespace + ".selectUnapproveDoc", m_id);
		//int j=0;
		for(HashMap i : tmpOutput) {
			 Iterator<String> iterator = i.keySet().iterator();
				
				while (iterator.hasNext()) { 
					String key = (String)iterator.next(); // 키 얻기
					// System.out.println(j+"--------------------------------key="+key+" / value="+i.get(key));  // 출력
					unapprDocMap.put(i.get("a_num").toString(), (Boolean)i.get("a_check"));
				}
				//j++;
		}

		
		return unapprDocMap;
	}

}
