package com.test.theacademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.theacademy.model.Question;
import com.test.theacademy.model.TestDetails;
import com.test.theacademy.model.UserAnswer;
import com.test.theacademy.repository.TestDAO;
import com.test.theacademy.repository.UserAnswerDAO;

@Service
public class TestService {

	@Autowired
	TestDAO testDAO;

	@Autowired
	UserAnswerDAO uaDao;

	public Question UpdateAnswerAndGetNextQuestion(UserAnswer ua, Question q) {

		uaDao.updateUserAnswer(ua, q.getId());

		Question nextQuestion = testDAO.getQuestion(q.getQuestionno() + 1,
					q.getSectionid(), ua.getUserid());
		
		// uaDao.checkAndUpdateStatus(nextQuestion.getId(), ua.getUserid());

		return nextQuestion;
	}
	
	public Question markAnswerAndGetQuestion(UserAnswer ua, Question q) {

		uaDao.updateUserAnswer(ua, q.getId());

		Question question = testDAO.getQuestion(q.getQuestionno(),
					q.getSectionid(), ua.getUserid());
		
		// uaDao.checkAndUpdateStatus(nextQuestion.getId(), ua.getUserid());

		return question;
	}

	public Question getNextQuestion(int questionno, int sectionid, int userId) {

		Question q = testDAO.getQuestion(questionno, sectionid, userId);
		// uaDao.checkAndUpdateStatus(q.getId(), userId);
		return q;
	}

	public Question getQuestionById(Integer qid, int userId) {
		
		// uaDao.checkAndUpdateStatus(qid, userId);
		return testDAO.getQuestionById(qid, userId);
	}

	public TestDetails getTestDetails(int testid) {
		return testDAO.getTestDetails(testid);
	}

	public boolean isLastQuestion(Integer questionno, Integer sectionId) {
		
		return testDAO.isLastQuestion(questionno, sectionId);
	}

	public void UpdateAnswer(UserAnswer ua, Question q) {
		
		uaDao.updateUserAnswer(ua, q.getId());
	}

	public int getTotalQuestions(int sectionid) {
		
		return testDAO.getTotalQuestions(sectionid);
	}

	public int getStartingQuestionNo(Integer sectionId) {
		
		return testDAO.getStartingQuestionNo(sectionId);
	}

	public int getLastQuestions(int sectionid) {
		
		return testDAO.getLastQuestions(sectionid);
	}

	public Question updateAnswerAndGetPrevQuestion(UserAnswer ua, Question q) {
		
		uaDao.updateUserAnswer(ua, q.getId());
		Question nextQuestion = testDAO.getQuestion(q.getQuestionno() -1,
				q.getSectionid(), ua.getUserid());
		return nextQuestion;
	}

	public int getStartingSectionId(Integer testid) {
		// TODO Auto-generated method stub
		return testDAO.getFirstSectionId(testid);
	}

}
