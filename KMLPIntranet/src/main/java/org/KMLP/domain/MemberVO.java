package org.KMLP.domain;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {			//사원정보

	private String m_id;		//사번
	private String m_pwd;		//비밀번호
	private String m_name;		//이름
	private String m_dept;		//부서명
	private String m_posit;		//직급
	private String m_email_id;	//이메일아이디
	private String m_email_do;	//이메일도메인
	private String m_cell;		//핸드폰번호
	private String m_com_date;	//입사일자
	private String m_quit_date;	//퇴사일자
	private MultipartFile file;
	private String savedName;
	private String authority;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_dept() {
		return m_dept;
	}
	public void setM_dept(String m_dept) {
		this.m_dept = m_dept;
	}
	public String getM_posit() {
		return m_posit;
	}
	public void setM_posit(String m_posit) {
		this.m_posit = m_posit;
	}
	public String getM_email_id() {
		return m_email_id;
	}
	public void setM_email_id(String m_email_id) {
		this.m_email_id = m_email_id;
	}
	public String getM_email_do() {
		return m_email_do;
	}
	public void setM_email_do(String m_email_do) {
		this.m_email_do = m_email_do;
	}
	public String getM_cell() {
		return m_cell;
	}
	public void setM_cell(String m_cell) {
		this.m_cell = m_cell;
	}
	public String getM_com_date() {
		return m_com_date;
	}
	public void setM_com_date(String m_com_date) {
		this.m_com_date = m_com_date;
	}
	public String getM_quit_date() {
		return m_quit_date;
	}
	public void setM_quit_date(String m_quit_date) {
		this.m_quit_date = m_quit_date;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSavedName() {
		return savedName;
	}
	public void setSavedName(String savedName) {
		this.savedName = savedName;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
	
}
