package org.KMLP.domain;

public class DocumentVO {				//일일업무보고서

	private String d_num; 				// 문서번호
	private String d_date;				// 작성일자 
	private String d_id; 				// 작성자
	private String d_title;				// 제목
	private String d_content;			// 업무내용
	private boolean d_final_condition; 	// 최종승인여부
	private int d_final_cnt;			// 총 결재단계
	private int d_now_cnt;				// 현재 결재단계
	public static int d_upload_cnt; 	// 총 게시글 수
	
	
	public String getD_num() {
		return d_num;
	}
	public void setD_num(String d_num) {
		this.d_num = d_num;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public boolean isD_final_condition() {
		return d_final_condition;
	}
	public void setD_final_condition(boolean d_final_condition) {
		this.d_final_condition = d_final_condition;
	}
	public int getD_final_cnt() {
		return d_final_cnt;
	}
	public void setD_final_cnt(int d_final_cnt) {
		this.d_final_cnt = d_final_cnt;
	}

	public int getD_now_cnt() {
		return d_now_cnt;
	}
	public void setD_now_cnt(int d_now_cnt) {
		this.d_now_cnt = d_now_cnt;
	}
	
	
	 
}


