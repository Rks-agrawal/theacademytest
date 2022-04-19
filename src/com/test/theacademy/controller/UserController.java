package com.test.theacademy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.theacademy.model.Feedback;
import com.test.theacademy.model.Option;
import com.test.theacademy.model.Question;
import com.test.theacademy.model.Section;
import com.test.theacademy.model.TestDetails;
import com.test.theacademy.model.UserAnswer;
import com.test.theacademy.model.UserProfile;
import com.test.theacademy.model.UserSection;
import com.test.theacademy.model.UserTestDetails;
import com.test.theacademy.service.AdminService;
import com.test.theacademy.service.TestService;
import com.test.theacademy.service.UserAnswerService;
import com.test.theacademy.service.UserService;

@Controller
public class UserController {

	private SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYYY");
	@Autowired
	TestService testService;
	@Autowired
	UserService UserService;
	@Autowired
	UserAnswerService UserAnswerService;
	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/home")
	@ResponseBody
	public String getHomePage(Model model) {
		return "Welcome";

	}

	@RequestMapping(value = "/quiz")
	public String getQuizPage(@RequestParam(value = "userId") Integer userId,
			//@RequestParam(value = "defaultLanguage") String defaultLanguage,
			Model model) {

		int questionno = 1;
		int testid = 2;

		int sectionid = testService.getStartingSectionId(testid);
		String defaultLanguage = "english";
		UserService.updateDefaultLanguage(defaultLanguage, userId);
		UserService.setActiveSession(sectionid, userId);
		int lastQuestions = testService.getLastQuestions(sectionid);
		int firstQuestion = testService.getStartingQuestionNo(sectionid);
		
		UserProfile user = UserService.getUserDetails(userId);
		Question question = testService.getNextQuestion(questionno, sectionid,
				userId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionid);
		TestDetails test = testService.getTestDetails(testid);
		model.addAttribute("lastQuestion", lastQuestions);
		model.addAttribute("firstQuestion", firstQuestion);
		model.addAttribute("test", test);
		model.addAttribute("question", question);
		model.addAttribute("user", user);
		model.addAttribute("section", section);
		return "quiz";

	}

	@RequestMapping(value = "/next")
	public String getNextQuestion(
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "sectionId") Integer sectionId,
			@RequestParam(value = "questionNo") Integer questionno,
			@RequestParam(value = "optionMarked", required = false) Integer optionMarked,
			@RequestParam(value = "status") String status,
			@RequestParam(value = "questionId") Integer qid,
			@RequestParam(value = "timeleft") Integer timeleft, Model model) {

		Question q = new Question();
		q.setId(qid);
		q.setQuestionno(questionno);
		q.setSectionid(sectionId);

		UserAnswer ua = new UserAnswer();
		ua.setUserid(userId);
		ua.setOptionMarked(optionMarked);
		ua.setqStatus(status);
		Question question = testService.UpdateAnswerAndGetNextQuestion(ua, q);

		UserService.updateTimer(timeleft, userId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionId);

		model.addAttribute("question", question);
		model.addAttribute("section", section);
		return "questionBox";

	}

	@RequestMapping(value = "/mark")
	public String markQuestion(
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "sectionId") Integer sectionId,
			@RequestParam(value = "questionNo") Integer questionno,
			@RequestParam(value = "optionMarked", required = false) Integer optionMarked,
			@RequestParam(value = "status") String status,
			@RequestParam(value = "questionId") Integer qid,
			@RequestParam(value = "timeleft") Integer timeleft, Model model) {

		Question q = new Question();
		q.setId(qid);
		q.setQuestionno(questionno);
		q.setSectionid(sectionId);

		UserAnswer ua = new UserAnswer();
		ua.setUserid(userId);
		ua.setOptionMarked(optionMarked);
		ua.setqStatus(status);
		Question question = testService.markAnswerAndGetQuestion(ua, q);

		UserService.updateTimer(timeleft, userId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionId);

		model.addAttribute("question", question);
		model.addAttribute("section", section);
		return "questionBox";

	}
	@RequestMapping(value = "/prev")
	public String getPrevQuestion(
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "sectionId") Integer sectionId,
			@RequestParam(value = "questionNo") Integer questionno,
			@RequestParam(value = "optionMarked", required = false) Integer optionMarked,
			@RequestParam(value = "status") String status,
			@RequestParam(value = "questionId") Integer qid,
			@RequestParam(value = "timeleft") Integer timeleft, Model model) {

		Question q = new Question();
		q.setId(qid);
		q.setQuestionno(questionno);
		q.setSectionid(sectionId);

		UserAnswer ua = new UserAnswer();
		ua.setUserid(userId);
		ua.setOptionMarked(optionMarked);
		ua.setqStatus(status);
		Question question = testService.updateAnswerAndGetPrevQuestion(ua, q);

		UserService.updateTimer(timeleft, userId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionId);

		model.addAttribute("question", question);
		model.addAttribute("section", section);
		return "questionBox";

	}
	
	@RequestMapping(value = "/register")
	public String getRegistrationPage(Model model) {
		return "registration";

	}

	@RequestMapping(value = "/login")
	public String getInstructionsPage(Model model) {
		return "login";

	}
	
	@RequestMapping(value = "/finish")
	public String getLastPage(Model model) {
		return "finish";

	}
	
	@RequestMapping(value = "/instructions")
	public String getCandidateDetailsPage(
			@RequestParam(value = "userId") Integer userId,
			Model model) {
		model.addAttribute("userid", userId);
		return "instructions";

	}

	@RequestMapping(value = "/registerUser")
	public String getLoginPage(
			@RequestParam(value = "firstName") String firstname,
			@RequestParam(value = "lastName") String lastname,
			@RequestParam(value = "emailID") String emailId,
			@RequestParam(value = "mobileNo") String mobile,
			@RequestParam(value = "gender") String gender,
			@RequestParam(value = "dob") String dob, Model model) {

		UserProfile newUser = new UserProfile();
		newUser.setFirstName(firstname);
		newUser.setLastName(lastname);
		newUser.setEmailID(emailId);
		newUser.setMobileNo(mobile);
		newUser.setGender(gender);
		try {
			newUser.setDob(sdf.parse(dob));
		} catch (ParseException e) {
			newUser.setDob(new Date());
		}
		int rollno = UserService.registerUser(newUser);
		newUser.setRollno(rollno);
		model.addAttribute("user", newUser);
		return "login";

	}

	@RequestMapping(value = "/getQuestionId")
	public String getParicularQuestion(
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "questionId") Integer qid,
			@RequestParam(value = "sectionId") Integer sectionId,
			@RequestParam(value = "timeleft") Integer timeleft, Model model) {

		Question question = testService.getQuestionById(qid, userId);
		UserService.updateTimer(timeleft, userId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionId);
		model.addAttribute("question", question);
		model.addAttribute("section", section);
		return "questionBox";

	}

	@RequestMapping(value = "/validateLogin")
	public String validateLogin(
			@RequestParam(value = "rollno") Integer rollno,
			@RequestParam(value = "password") String password, Model model) {
		password ="admin";
		UserProfile user = UserService.validateUser(rollno, password);
		if (user == null) {
			model.addAttribute("loginerror", "Incorrect Username/Password.");
			return "login";
		}
		if (user.getIsTestSetup() == null
				|| !user.getIsTestSetup().equalsIgnoreCase("yes")) {
			UserService.setUpTest(user, 2);
		}
		model.addAttribute("user", user);
		return "candidateDetails";
	}

	@RequestMapping(value = "/admin")
	public String getTestDetails(Model model) {

		return "admin";
	}

	@RequestMapping(value = "/testDetails")
	public String getTestDetails(
			@RequestParam(value = "testid") Integer testid, Model model) {

		TestDetails test = testService.getTestDetails(testid);
		model.addAttribute("test", test);

		return "testDetails";
	}

	@RequestMapping(value = "/updateTest")
	public String updateTest(@RequestParam(value = "testid") Integer testid,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "totalSections") Integer totalSections,
			@RequestParam(value = "totalMarks") Integer totalMarks,
			@RequestParam(value = "duration") Integer duration, Model model) {
		TestDetails test = new TestDetails();

		test.setId(testid);
		test.setName(name);
		test.setDuration(duration);
		test.setTotalSections(totalSections);
		test.setTotalMarks(totalMarks);
		adminService.updateTestDetails(test);

		test = testService.getTestDetails(testid);
		model.addAttribute("test", test);

		return "testDetails";
	}

	@RequestMapping(value = "/updateSection")
	public String updateSectiondetails(
			@RequestParam(value = "testid") Integer testid,
			@RequestParam(value = "sectionid") Integer sectionid,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "totalQuestions") Integer totalQuestions,
			@RequestParam(value = "totalMarks") Integer totalMarks,
			@RequestParam(value = "duration") Integer duration, Model model) {
		Section s = new Section();
		s.setId(sectionid);
		s.setName(name);
		s.setDuration(duration);
		s.setTotalQuestions(totalQuestions);
		s.setTotalMarks(totalMarks);

		adminService.updateSectionDetails(s);

		TestDetails test = testService.getTestDetails(testid);
		model.addAttribute("test", test);

		return "testDetails";
	}

	@RequestMapping(value = "/showQuestionList")
	public String getAllQuestions(
			@RequestParam(value = "sectionId") Integer sectionid, Model model) {
		Section section = adminService.getSectionDetails(sectionid);

		model.addAttribute("section", section);

		return "sectionDetails";
	}

	@RequestMapping(value = "/updateQuestion")
	@ResponseBody
	public String updateQuestionDetails(
			@RequestParam(value = "questionid") Integer id,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "name_hindi") String nameHindi,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "marks") Integer marks,
			@RequestParam(value = "answer") Integer answer,
			@RequestParam(value = "filename") String filename,
			@RequestParam(value = "paragraph") String paragraph,
			@RequestParam(value = "pHindi") String pHindi, Model model) {

		String decode = "";
		String decodeHindiPara ="";
		try {
			decode = URLDecoder.decode(nameHindi, "UTF-8");
			decodeHindiPara = URLDecoder.decode(pHindi, "UTF-8");
			name = URLDecoder.decode(name, "UTF-8");
			paragraph = URLDecoder.decode(paragraph, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Question q = new Question();
		q.setId(id);
		q.setQuestion(name);
		q.setqHindi(decode);
		q.setType(type);
		q.setOptionId(answer);
		q.setMarks(marks);
		q.setParagraph(paragraph);
		q.setFilepath(filename);
		q.setpHindi(decodeHindiPara);
		int response = adminService.updateQuestion(q);

		return response == 1 ? "success" : "failure";
	}

	@RequestMapping(value = "/updateOption")
	@ResponseBody
	public String updateOptionDetails(
			@RequestParam(value = "optionid") Integer id,
			@RequestParam(value = "value") String value,
			@RequestParam(value = "value_hindi") String valueHindi,
			@RequestParam(value = "filepath") String filepath, Model model) {

		String decode = "";
		try {
			decode = URLDecoder.decode(valueHindi, "UTF-8");
			value =URLDecoder.decode(value, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Option o = new Option();
		o.setKey(id);
		o.setValue(value);
		o.setValueHindi(decode);
		o.setFilepath(filepath);

		int response = adminService.updateOption(o);

		return response == 1 ? "success" : "failure";
	}

	@RequestMapping(value = "/nextSection")
	public String nextSection(@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "sectionId") Integer sectionId,
			@RequestParam(value = "timeleft") Integer timeleft, Model model) {

		UserService.updateTimer(timeleft, userId);

		int questionno = testService.getStartingQuestionNo(sectionId);
		UserService.setActiveSession(sectionId, userId);

		
		UserProfile user = UserService.getUserDetails(userId);
		Question question = testService.getNextQuestion(questionno, sectionId,
				userId);
		int lastQuestions = testService.getLastQuestions(sectionId);
		UserSection section = UserAnswerService.getActiveSection(userId,
				sectionId);

		TestDetails test = testService.getTestDetails(2);
		model.addAttribute("lastQuestion", lastQuestions);
		model.addAttribute("test", test);
		model.addAttribute("question", question);
		model.addAttribute("user", user);
		model.addAttribute("section", section);
		return "quizbody";
	}

	

	@RequestMapping(value = "/submitTest")
	public String submitTest(@RequestParam(value = "userId") Integer userId,
			Model model) {
		UserService.updateTimer(0, userId);
		UserTestDetails testDetails = UserService.getUserTestDetails(userId);
		model.addAttribute("testDetails", testDetails);
		UserProfile user = UserService.getUserDetails(userId);
		model.addAttribute("user", user);
		return "result";
	}
	@RequestMapping(value = "/instructionModal")
	public String getInstructionModal(@RequestParam(value = "modal") String moduleName,
			@RequestParam(value = "userId") Integer userId,
			Model model) {
		if(moduleName.equalsIgnoreCase("profileModal")){
			UserProfile user = UserService.getUserDetails(userId);
			model.addAttribute("user", user);
		}
		return moduleName;
	}
	@RequestMapping(value = "/feedback")
	public String getFeedBackPage(@RequestParam(value = "userid") Integer userid,
			Model model) {
		UserProfile user = UserService.getUserDetails(userid);
		model.addAttribute("user", user);
		return "feedback";
	}
	
	@RequestMapping(value = "/studentDetails")
	public String getStudentDetails(Model model) {

		List<UserProfile> users = adminService.getUsersDetails();
		
		return "studentDetails";
	}
	
	@RequestMapping(value = "/calculateResult")
	public String calculateStudentResult(Model model) {

		adminService.calculateResult();
		
		return "studentDetails";
	}
	
	@RequestMapping(value = "/submitFeedback")
	public String submitFeedback(@RequestParam(value = "userid") Integer userid,
			@RequestParam(value = "ques1") String ques1,
			@RequestParam(value = "ques2") String ques2,
			@RequestParam(value = "ques31") String ques31,
			@RequestParam(value = "ques32") String ques32,
			@RequestParam(value = "ques33") String ques33,
			@RequestParam(value = "ques34") String ques34,
			@RequestParam(value = "ques35") String ques35,
			@RequestParam(value = "ques36") String ques36,
			@RequestParam(value = "overallFeedback") String overallFeedback,
			Model model) {
		
		Feedback fb = new Feedback();
		fb.setQues1(ques1);
		fb.setQues2(ques2);
		fb.setQues31(ques31);
		fb.setQues32(ques32);
		fb.setQues33(ques33);
		fb.setQues34(ques34);
		fb.setQues35(ques35);
		fb.setQues36(ques36);
		fb.setOverallFeedback(overallFeedback);
		
		UserService.submitFeedback(userid, fb);
		return "finish";
	}
}
