
package org.KMLP.domain;


public class ApproveVO {

	private String a_num;		//문서번호
	private String a_appr_num;	//결재횟수
	private String a_id;		//수신자
	private boolean a_check;	//승인여부
	
	public String getA_num() {
		return a_num;
	}
	public void setA_num(String a_num) {
		this.a_num = a_num;
	}
	public String getA_appr_num() {
		return a_appr_num;
	}
	public void setA_appr_num(String a_appr_num) {
		this.a_appr_num = a_appr_num;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public boolean isA_check() {
		return a_check;
	}
	public void setA_check(boolean a_check) {
		this.a_check = a_check;
	} 	
	
	
	
}
