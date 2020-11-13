package com.cbox.QnA.vo;

import java.sql.Date;

public class QnAVO {
	private int qa_no;
	private String qa_type;
	private String qa_title;
	private String qa_cont;
	private String qa_name;
	private Date qa_date;
	private String qa_ad_comment;
	
	
	public String getQa_ad_comment() {
		return qa_ad_comment;
	}
	public void setQa_ad_comment(String qa_ad_comment) {
		this.qa_ad_comment = qa_ad_comment;
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
