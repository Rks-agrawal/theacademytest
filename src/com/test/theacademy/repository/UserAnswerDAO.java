package com.test.theacademy.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.test.theacademy.model.UserAnswer;
import com.test.theacademy.model.UserSection;

@Repository
public class UserAnswerDAO {

	private static final String UPDATE_USER_ANSWER = "UPDATE useranswerdetails SET optionmarked =?"
			+ ", answerstatus =? WHERE userid =? and questionid =?";
	
	private static final String UPDATE_USER_SECTION = "UPDATE usersectiondetails SET sectionmarks =?"
			+ ", totalappeared =?, unappeared =?, totalcorrect =?, incorrect = ? WHERE userid =? AND sectionid =?";
	
	private static final String UPDATE_USER_TEST ="UPDATE usertestdetails SET marksobtained =? WHERE userid =? and testid =?";
	
	private static final String GET_ACTIVE_SECTION = "SELECT questionid, displayQuestionno, answerstatus FROM `useranswerdetails`,"
			+ " `question` WHERE question.id =useranswerdetails.questionid and userid = ? AND sectionid = ?";
	private JdbcTemplate jdbcTemplate;
	private UserSection section;

	@Autowired
	public void setDataSource(@Qualifier("dataSource") DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("Connected to database");
	}

	public int updateUserAnswer(UserAnswer uAnswer, int qid) {

		int success = this.jdbcTemplate.update(UPDATE_USER_ANSWER,
				uAnswer.getOptionMarked(), uAnswer.getqStatus(),
				uAnswer.getUserid(), qid);
		
		return success;
	}

	public UserSection getUserSection(int userID, int sectionId) {
		section = new UserSection();
		List<UserAnswer> answers = new ArrayList<UserAnswer>();
		int answered =0, notAnswered =0, marked =0, markedAndReview =0, notVisited =0;;
		
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				GET_ACTIVE_SECTION, new Object[] { userID, sectionId });
		for (Map<String, Object> row : rows) {

			UserAnswer u = new UserAnswer();

			u.setQuestionno((Integer) (row.get("displayQuestionno")));
			u.setQuestionId((Integer)(row.get("questionid")));
			String status = (String) (row.get("answerstatus"));
			u.setqStatus(status);
			if(status.equalsIgnoreCase("attempt")){
				answered++;
			}else if(status.equalsIgnoreCase("unattempt")){
				notAnswered++;
			}else if(status.equalsIgnoreCase("qnodisp_tag")){
				marked++;
			}else if(status.equalsIgnoreCase("qno_ans_tag")){
				markedAndReview++;
			}else{
				notVisited++;
			}
			answers.add(u);
		}
		section.setId(sectionId);
		section.setAnswers(answers);
		section.setAnswered(answered);
		section.setNotAnswered(notAnswered);
		section.setMarked(marked);
		section.setAnsweredAndMarked(markedAndReview);
		section.setNotVisited(notVisited);
		Integer timeleft =0;
		String name ="";
		try{
			timeleft =jdbcTemplate.queryForObject(
					"SELECT timeleft FROM usertestdetails WHERE userid=?",
					new Object[] { userID }, Integer.class);
			name =jdbcTemplate.queryForObject(
					"SELECT name FROM section WHERE id =?",
					new Object[] { sectionId}, String.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		section.setDuration(timeleft);
		section.setName(name);
		return section;
	}

	/*public void checkAndUpdateStatus(Integer questionId, Integer userId) {
		// TODO Auto-generated method stub
		String status = jdbcTemplate.queryForObject(
				"SELECT answerstatus FROM useranswerdetails WHERE questionid =? AND userid =?",
				new Object[] { questionId, userId}, String.class);
		if(status.equalsIgnoreCase("not-visited")){
			jdbcTemplate.update("UPDATE useranswerdetails SET answerstatus='not-answered' WHERE userid =?"
					+ " AND questionid =?", new Object[]{userId, questionId});
		}
	}*/

}
