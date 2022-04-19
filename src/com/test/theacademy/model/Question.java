package com.test.theacademy.model;

import java.util.List;

public class Question {

	private Integer id;
	private Integer questionno;
	private String question;
	private String qHindi;
	private String type;
	private Integer sectionid;
	private Integer optionMarked;
	private String answer;
	private String filepath;
	private String paragraph;
	private String pHindi;
	private Integer marks;
	private Integer optionId;

	private List<Option> options;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Option> getOptions() {
		return options;
	}

	public void setOptions(List<Option> options) {
		this.options = options;
	}

	public Integer getQuestionno() {
		return questionno;
	}

	public void setQuestionno(Integer questionno) {
		this.questionno = questionno;
	}

	public Integer getSectionid() {
		return sectionid;
	}

	public void setSectionid(Integer sectionid) {
		this.sectionid = sectionid;
	}

	public Integer getOptionMarked() {
		return optionMarked;
	}

	public void setOptionMarked(Integer optionMarked) {
		this.optionMarked = optionMarked;
	}

	public String getqHindi() {
		return qHindi;
	}

	public void setqHindi(String qHindi) {
		this.qHindi = qHindi;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public String getpHindi() {
		return pHindi;
	}

	public void setpHindi(String pHindi) {
		this.pHindi = pHindi;
	}

	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

}
