package org.KMLP.persistence;

import org.KMLP.domain.ApproveVO;

public interface ApproveDAO {
	public void insert(ApproveVO avo);

	public void update_condition(ApproveVO avo);
}
