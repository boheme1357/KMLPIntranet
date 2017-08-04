package org.KMLP.domain;

public class NoticeVO {			//공지사항

	
	private int n_num;						//일련번호
	private String n_wdate;			//작성일자
	private String n_id;			//사번
	private String n_title ; 		//제목
	private String n_content ;	//내용
	private String n_file ;			//첨부파일
	private String n_udate ;		//수정일자
	private int n_viewcnt;		//조회횟수
	
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_wdate() {
		return n_wdate;
	}
	public void setN_wdate(String n_wdate) {
		this.n_wdate = n_wdate;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_file() {
		return n_file;
	}
	public void setN_file(String n_file) {
		this.n_file = n_file;
	}
	public String getN_udate() {
		return n_udate;
	}
	public void setN_udate(String n_udate) {
		this.n_udate = n_udate;
	}
	public int getN_viewcnt() {
		return n_viewcnt;
	}
	public void setN_viewcnt(int n_viewcnt) {
		this.n_viewcnt = n_viewcnt;
	}

	
	

	
	
	
}
