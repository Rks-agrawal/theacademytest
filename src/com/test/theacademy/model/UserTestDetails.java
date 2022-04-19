package com.test.theacademy.model;

import java.util.List;

public class UserTestDetails {

	private UserProfile user;
	private TestDetails test;
	private Integer timeleft;
	private Integer totalAttempted;
	private Integer totalUnAttempted;

	private List<UserSection> userSections;

	public Integer getTimeleft() {
		return timeleft;
	}

	public void setTimeleft(Integer timeleft) {
		this.timeleft = timeleft;
	}

	public UserProfile getUser() {
		return user;
	}

	public void setUser(UserProfile user) {
		this.user = user;
	}

	public TestDetails getTest() {
		return test;
	}

	public void setTest(TestDetails test) {
		this.test = test;
	}

	public List<UserSection> getUserSections() {
		return userSections;
	}

	public void setUserSections(List<UserSection> userSections) {
		this.userSections = userSections;
	}

	public Integer getTotalAttempted() {
		return totalAttempted;
	}

	public void setTotalAttempted(Integer totalAttempted) {
		this.totalAttempted = totalAttempted;
	}

	public Integer getTotalUnAttempted() {
		return totalUnAttempted;
	}

	public void setTotalUnAttempted(Integer totalUnAttempted) {
		this.totalUnAttempted = totalUnAttempted;
	}

}
