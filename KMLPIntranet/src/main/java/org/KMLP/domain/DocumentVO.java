package org.KMLP.domain;

public class DocumentVO {			//일일업무보고서

	private String d_num; 			//문서번호
	private String d_date;			//작성일자 
	private String d_id; 			//작성자
	private String d_title;			//제목
	private String d_content;		//업무내용
	private boolean d_final_check; 	//최종승인여부
	private int d_appr_cnt;			//결재횟수
	
	
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
	public boolean isD_final_check() {
		return d_final_check;
	}
	public void setD_final_check(boolean d_final_check) {
		this.d_final_check = d_final_check;
	}
	public int getD_appr_cnt() {
		return d_appr_cnt;
	}
	public void setD_appr_cnt(int d_appr_cnt) {
		this.d_appr_cnt = d_appr_cnt;
	}
	
	
	 
}


