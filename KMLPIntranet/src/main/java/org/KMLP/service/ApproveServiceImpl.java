package org.KMLP.service;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.KMLP.persistence.ApproveDAO;

public class ApproveServiceImpl implements ApproveService {
	
	@Inject
	ApproveDAO dao;
	
	

	@Override
	public void insert(ApproveVO avo, String d_num) {
		dao.insert(avo, d_num);		
	}
}
