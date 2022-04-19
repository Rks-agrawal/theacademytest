package com.test.theacademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.theacademy.model.UserAnswer;
import com.test.theacademy.model.UserSection;
import com.test.theacademy.repository.UserAnswerDAO;

@Service
public class UserAnswerService {

	@Autowired
	UserAnswerDAO answerDAO;
	
	public int updateUserAnswer(UserAnswer uAnswer){
		
		return answerDAO.updateUserAnswer(uAnswer, 1);
	}
	
	public UserSection getActiveSection(int userID, int sectionId) {
		return answerDAO.getUserSection(userID, sectionId);
	}
}
