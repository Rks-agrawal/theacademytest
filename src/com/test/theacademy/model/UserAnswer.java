package com.test.theacademy.model;

public class UserAnswer {

	private Integer id;

	private Integer userid;
	private Integer questionno;
	private Integer questionId;
	private Integer optionMarked;

	private String answer;

	private String qStatus;

	public Integer getUserid() {
		return userid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getQuestionno() {
		return questionno;
	}

	public void setQuestionno(Integer questionno) {
		this.questionno = questionno;
	}

	public Integer getOptionMarked() {
		return optionMarked;
	}

	public void setOptionMarked(Integer optionMarked) {
		this.optionMarked = optionMarked;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

}
