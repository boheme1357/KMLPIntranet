package org.KMLP.service;

import org.KMLP.domain.ApproveVO;

public interface ApproveService {
	public void insert(ApproveVO avo);

	public void update_condition(String a_num, int a_cnt, String a_id, boolean a_condition);
}
