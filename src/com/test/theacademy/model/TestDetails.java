package com.test.theacademy.model;

import java.util.List;

public class TestDetails {

	private Integer id;
	private String name;
	private Integer totalSections;
	private Integer totalMarks;
	private Integer maxSectionId;

	private Integer duration;

	private List<Section> sections;

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

	public List<Section> getSections() {
		return sections;
	}

	public void setSections(List<Section> sections) {
		this.sections = sections;
	}

	public Integer getTotalSections() {
		return totalSections;
	}

	public void setTotalSections(Integer totalSections) {
		this.totalSections = totalSections;
	}

	public Integer getTotalMarks() {
		return totalMarks;
	}

	public void setTotalMarks(Integer totalMarks) {
		this.totalMarks = totalMarks;
	}

	public Integer getMaxSectionId() {
		return maxSectionId;
	}

	public void setMaxSectionId(Integer maxSectionId) {
		this.maxSectionId = maxSectionId;
	}

}
