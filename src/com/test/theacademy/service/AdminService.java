package com.test.theacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.theacademy.model.Option;
import com.test.theacademy.model.Question;
import com.test.theacademy.model.Section;
import com.test.theacademy.model.TestDetails;
import com.test.theacademy.model.UserProfile;
import com.test.theacademy.repository.AdminDAO;
import com.test.theacademy.repository.TestDAO;

@Service
public class AdminService {

	@Autowired
	TestDAO testDao;
	
	@Autowired
	AdminDAO adminDao;
	
	public int updateTestDetails(TestDetails test){
		
		int response = adminDao.updateTestDetails(test);
		adminDao.checkAndUpdateSection(test);
		return response;
	}
	
	public Section getSectionDetails(int sectionId){
		return testDao.getsectionDetails(sectionId);
	}

	public int updateSectionDetails(Section s) {
		int response =adminDao.updatesectionDetails(s);
		adminDao.checkAndUpdateQuestions(s);
		return response;
		
	}

	public int updateQuestion(Question q) {
		return adminDao.updateQuestion(q);
		
	}

	public int updateOption(Option o) {
		// TODO Auto-generated method stub
		return adminDao.updateOption(o);
	}

	public List<UserProfile> getUsersDetails() {
		// TODO Auto-generated method stub
		return adminDao.getUserDetails();
	}

	public void calculateResult() {
		// TODO Auto-generated method stub
		adminDao.calculateResult();
	}
	
}
