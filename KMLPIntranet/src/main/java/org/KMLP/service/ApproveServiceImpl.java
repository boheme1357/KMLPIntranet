package org.KMLP.service;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.KMLP.persistence.ApproveDAO;
import org.springframework.stereotype.Service;

@Service
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
	public void update_condition(String a_num, int a_cnt, String a_id, boolean a_condition) {
		ApproveVO avo = new ApproveVO();
		avo.setA_num(a_num);
		avo.setA_id(a_id);
		avo.setA_cnt(a_cnt);
		avo.setA_condition(a_condition);
		if (a_condition) {
			dao.update_condition(avo);
			documentService.update_now_cnt(a_num, a_cnt);
			documentService.update_final_condition(a_num);
		} else {
			dao.update_condition(avo);
			//dao.update_ar_text(avo);
		}

	}
}
