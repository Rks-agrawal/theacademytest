package com.test.theacademy.model;

import java.util.List;

public class UserSection {

	private Integer id;
	private Integer userid;
	private Integer sectionid;
	private String name;
	private List<UserAnswer> answers;

	private Integer answered;
	private Integer notAnswered;
	private Integer marked;
	private Integer answeredAndMarked;
	private Integer duration;
	private Integer notVisited;
	private Integer totalQuestions;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getSectionid() {
		return sectionid;
	}

	public void setSectionid(Integer sectionid) {
		this.sectionid = sectionid;
	}

	public List<UserAnswer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<UserAnswer> answers) {
		this.answers = answers;
	}

	public Integer getAnswered() {
		return answered;
	}

	public void setAnswered(Integer answered) {
		this.answered = answered;
	}

	public Integer getNotAnswered() {
		return notAnswered;
	}

	public void setNotAnswered(Integer notAnswered) {
		this.notAnswered = notAnswered;
	}

	public Integer getMarked() {
		return marked;
	}

	public void setMarked(Integer marked) {
		this.marked = marked;
	}

	public Integer getAnsweredAndMarked() {
		return answeredAndMarked;
	}

	public void setAnsweredAndMarked(Integer answeredAndMarked) {
		this.answeredAndMarked = answeredAndMarked;
	}

	public Integer getNotVisited() {
		return notVisited;
	}

	public void setNotVisited(Integer notVisited) {
		this.notVisited = notVisited;
	}

	public Integer getTotalQuestions() {
		return totalQuestions;
	}

	public void setTotalQuestions(Integer totalQuestions) {
		this.totalQuestions = totalQuestions;
	}

}
