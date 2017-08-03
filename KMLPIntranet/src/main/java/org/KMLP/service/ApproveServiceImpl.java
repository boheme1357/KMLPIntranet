package org.KMLP.service;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.KMLP.domain.Approve_ReturnVO;
import org.KMLP.persistence.ApproveDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ApproveServiceImpl implements ApproveService {

	@Inject
	ApproveDAO dao;

	@Inject
	DocumentService documentService;

	@Override
	public void insert(ApproveVO avo) {
		dao.insert(avo);
	}

	@Override
	@Transactional
	public void update_condition(String a_num, int a_cnt, String a_id, boolean a_condition, Approve_ReturnVO arvo) {
		
		ApproveVO avo = new ApproveVO(a_num, a_cnt, a_condition, a_id);
		arvo.setAr_num(a_num);
		arvo.setAr_cnt(Integer.toString(a_cnt));
		arvo.setAr_id(a_id);
		
		if (a_condition) {
			dao.update_condition(avo);
			documentService.update_now_cnt(a_num, a_cnt);
			documentService.update_final_condition(a_num);
		} else {
			dao.update_condition(avo);
			arvo.setAr_return_cnt(dao.update_return_cnt(avo));
			dao.insert_approve_return(arvo);
		}

	}
}
