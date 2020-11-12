package com.cbox.QnA.vo;

import java.sql.Date;

public class QnAVO {
	private int qa_no;
	private String qa_type;
	private String qa_title;
	private String qa_cont;
	private String qa_name;
	private Date qa_date;
	private int qa_re_step;
	private int qa_re_ref;
	private int qa_re_lev;
	
	
	
	public int getQa_re_step() {
		return qa_re_step;
	}
	public void setQa_re_step(int qa_re_step) {
		this.qa_re_step = qa_re_step;
	}
	public int getQa_re_ref() {
		return qa_re_ref;
	}
	public void setQa_re_ref(int qa_re_ref) {
		this.qa_re_ref = qa_re_ref;
	}
	public int getQa_re_lev() {
		return qa_re_lev;
	}
	public void setQa_re_lev(int qa_re_lev) {
		this.qa_re_lev = qa_re_lev;
	}
	
	
	
	public String getQa_name() {
		return qa_name;
	}
	public void setQa_name(String qa_name) {
		this.qa_name = qa_name;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	public String getQa_type() {
		return qa_type;
	}
	public void setQa_type(String qa_type) {
		this.qa_type = qa_type;
	}
	public String getQa_cont() {
		return qa_cont;
	}
	public void setQa_cont(String qa_cont) {
		this.qa_cont = qa_cont;
	}
	public Date getQa_date() {
		return qa_date;
	}
	public void setQa_date(Date qa_date) {
		this.qa_date = qa_date;
	}

}
