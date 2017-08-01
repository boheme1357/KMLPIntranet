
package org.KMLP.domain;


public class ApproveVO {

	private String a_num;		//문서번호
	private String a_cnt;	//결재단계
	private String[] a_id_arr;		//수신자들
	private boolean a_condition;	//승인여부
	private String a_id; //특정수신자
	
	public String getA_num() {
		return a_num;
	}
	public void setA_num(String a_num) {
		this.a_num = a_num;
	}
	public String getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(String a_cnt) {
		this.a_cnt = a_cnt;
	}

	public boolean isA_condition() {
		return a_condition;
	}
	public void setA_condition(boolean a_condition) {
		this.a_condition = a_condition;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String[] getA_id_arr() {
		return a_id_arr;
	}
	public void setA_id_arr(String[] a_id_arr) {
		this.a_id_arr = a_id_arr;
	} 	
	
	
	
}
