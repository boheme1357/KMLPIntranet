
package org.KMLP.domain;


public class ApproveVO {

	// approve
	private String a_num;		//문서번호
	private int a_cnt;	//결재단계
	private String[] a_id_arr;		//수신자들
	private boolean a_condition;	//승인여부
	private String a_id; //특정수신자
	private int a_return_cnt; // 반려 횟수
	
	public ApproveVO() {}
	
	public ApproveVO(String a_num, int a_cnt, boolean a_condition, String a_id) {
		super();
		this.a_num = a_num;
		this.a_cnt = a_cnt;
		this.a_condition = a_condition;
		this.a_id = a_id;
	}
	
	
	public String getA_num() {
		return a_num;
	}
	public void setA_num(String a_num) {
		this.a_num = a_num;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
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
	public int getA_return_cnt() {
		return a_return_cnt;
	}
	public void setA_return_cnt(int a_return_cnt) {
		this.a_return_cnt = a_return_cnt;
	}
		
	
	
	
}
