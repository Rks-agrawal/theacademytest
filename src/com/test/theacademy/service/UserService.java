package com.test.theacademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.theacademy.model.Feedback;
import com.test.theacademy.model.UserProfile;
import com.test.theacademy.model.UserTestDetails;
import com.test.theacademy.repository.UserDAO;

@Service
public class UserService {

	@Autowired
	UserDAO userDAO;
	
	public UserProfile getUserDetails(int userId){
		return userDAO.getUserDetails(userId);
	}

	public void setUpTest(UserProfile user, int testid) {
		userDAO.setupTest(user, testid);
		
	}

	public UserProfile validateUser(Integer rollno, String password) {
		// TODO Auto-generated method stub
		return userDAO.validateLogin(rollno, password);
	}

	public int registerUser(UserProfile newUser) {
		// TODO Auto-generated method stub
		return userDAO.registerUser(newUser);
	}

	public void updateDefaultLanguage(String defaultLanguage, Integer userId) {
		// TODO Auto-generated method stub
		userDAO.updateDefaultLanguage(defaultLanguage, userId);
	}

	public void setActiveSession(int sectionid, int userid) {
		userDAO.setActiveSection(sectionid, userid);
		
	}

	public void updateTimer(Integer timeleft, Integer userId) {
		// TODO Auto-generated method stub
		userDAO.updateTimer(timeleft, userId);
	}

	public UserTestDetails getUserTestDetails(Integer userId) {
		// TODO Auto-generated method stub
		return userDAO.getTestDetails(userId);
	}

	public void submitFeedback(Integer userid, Feedback fb) {
		// TODO Auto-generated method stub
		userDAO.submitFeedback(userid, fb);
	}
}
