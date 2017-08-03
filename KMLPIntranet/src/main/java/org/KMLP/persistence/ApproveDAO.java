package org.KMLP.persistence;

import java.util.List;

import org.KMLP.domain.ApproveVO;
import org.KMLP.domain.Approve_ReturnVO;

public interface ApproveDAO {
	public void insert(ApproveVO avo);

	public void update_condition(ApproveVO avo);

	public void insert_approve_return(Approve_ReturnVO arvo);

	public String update_return_cnt(ApproveVO avo);

	public List<Approve_ReturnVO> selectReturnListAll(String ar_num);
}
