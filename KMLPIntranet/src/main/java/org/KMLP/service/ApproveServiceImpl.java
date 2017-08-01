package org.KMLP.service;

import javax.inject.Inject;

import org.KMLP.domain.ApproveVO;
import org.KMLP.persistence.ApproveDAO;
import org.springframework.stereotype.Service;

@Service
public class ApproveServiceImpl implements ApproveService {
	
	@Inject
	ApproveDAO dao;

	@Override
	public void insert(ApproveVO avo) {
		dao.insert(avo);		
	}
}
