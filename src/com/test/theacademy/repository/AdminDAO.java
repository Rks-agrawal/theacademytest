package com.test.theacademy.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.test.theacademy.model.Option;
import com.test.theacademy.model.Question;
import com.test.theacademy.model.Section;
import com.test.theacademy.model.TestDetails;
import com.test.theacademy.model.UserProfile;

@Repository
public class AdminDAO {

	private JdbcTemplate jdbcTemplate;

	private static final String UPDATE_TEST_DETAILS = "UPDATE test set name=?, duration=?, totalSection=?, totalMarks=? WHERE id =?";

	private static final String UPDATE_SECTION_DETAILS = "UPDATE section SET name =?, duration =?, totalQuestions =?, totalMarks =? WHERE id =?";
	private static final String UPDATE_QUESTION = "UPDATE question SET name =?, name_hindi =?, type =?, optionid =?, paragraph=?, paragraph_hindi =?, file=? WHERE id =?";
	private static final String UPDATE_OPTION = "UPDATE option SET value =?, value_hindi =?, filepath=? WHERE id =?";

	private static final String UPDATE_RESULT ="";
	@Autowired
	public void setDataSource(@Qualifier("dataSource") DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("Connected to database");
	}

	public int updateTestDetails(TestDetails test) {
		int success = 0;

		int count = jdbcTemplate.queryForObject(
		"SELECT count(*) FROM test", Integer.class);

		if (count ==0) {
			String query = "INSERT INTO test (name, duration, totalSection, totalMarks) VALUES (?,?,?,?)";
			success = jdbcTemplate.update(
					query,
					new Object[] { test.getName(), test.getDuration(),
							test.getTotalSections(), test.getTotalMarks() });
		} else {
			success = jdbcTemplate.update(
					UPDATE_TEST_DETAILS,
					new Object[] { test.getName(), test.getDuration(),
							test.getTotalSections(), test.getTotalMarks(),
							test.getId() });
		}
		return success;
	}

	public int updatesectionDetails(Section s) {
		// TODO Auto-generated method stub
		int success = jdbcTemplate.update(
				UPDATE_SECTION_DETAILS,
				new Object[] { s.getName(), s.getDuration(),
						s.getTotalQuestions(), s.getTotalMarks(), s.getId()

				});
		return success;
	}

	public int updateQuestion(Question q) {
		int success = jdbcTemplate.update(
				UPDATE_QUESTION,
				new Object[] { q.getQuestion(), q.getqHindi(), q.getType(),
						q.getOptionId(), q.getParagraph(), q.getpHindi(), q.getFilepath(), q.getId() });
		return success;
	}

	public int updateOption(Option o) {
		int success = jdbcTemplate.update(UPDATE_OPTION,
				new Object[] { o.getValue(), o.getValueHindi(), o.getFilepath(), o.getKey() });
		return success;
	}

	public void checkAndUpdateSection(TestDetails test) {
		// TODO Auto-generated method stub
		int totalSections = test.getTotalSections();
		if (test.getId() == null) {

			int id = jdbcTemplate.queryForObject("SELECT max(id) FROM test",
					Integer.class);
			test.setId(id);
		}
		int sections = 0;
		try {
			sections = jdbcTemplate.queryForObject(

			"SELECT count(*) FROM section WHERE testid =?",
					new Object[] { test.getId() }, Integer.class);
		} catch (Exception e) {

		}

		if (totalSections == sections) {
			return;
		} else if (sections < totalSections) {
			int rowToAdd = totalSections - sections;
			for (int i = 0; i < rowToAdd; i++) {
				jdbcTemplate
						.update("INSERT INTO section (name, testid) VALUES('',"
								+ test.getId() + ")");
			}
		} else {
			// int rowsToDelete = sections -totalSections;

		}

	}

	public void checkAndUpdateQuestions(Section s) {
		// TODO Auto-generated method stub
		int totalQuestions = 0;
		try {
			totalQuestions = jdbcTemplate.queryForObject(
					"SELECT count(id) FROM question WHERE sectionid =?",
					new Object[] { s.getId() }, Integer.class);
		} catch (Exception e) {

		}
		if (totalQuestions < s.getTotalQuestions()) {
			int questionsToAdd = s.getTotalQuestions() - totalQuestions;
			int qno = totalQuestions + 1;
			for (int i = 0; i < questionsToAdd; i++) {
				jdbcTemplate
						.update("INSERT INTO question (name, sectionid, questionno, type) VALUES('',"
								+ s.getId() + ", " + qno + ",'General')");
				int qid =jdbcTemplate.queryForObject("SELECT max(id) FROM question WHERE sectionid=?",
						new Object[]{s.getId()},
						Integer.class);
				addOptions(qid);
				qno++;
			}
		} else if (totalQuestions > s.getTotalQuestions()) {
			jdbcTemplate.update("DELETE FROM question WHERE sectionid="
					+ s.getId() + " AND questionno >" + s.getTotalQuestions());
		}
		setQuestionNo();
	}

	private void setQuestionNo() {
		// TODO Auto-generated method stub
		List<Integer> sectionids = new ArrayList<Integer>();
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				"SELECT id from section where testid=2 order by id");
		
		for (Map<String, Object> row : rows) {
			sectionids.add((Integer) (row.get("id")));
		}
		
		Integer qno =1;
		for(Integer sid : sectionids){
			List<Integer> questionids = new ArrayList<Integer>();
			rows = this.jdbcTemplate.queryForList(
					"SELECT id from question WHERE sectionid ="+sid);
			for (Map<String, Object> row : rows) {
				questionids.add((Integer) (row.get("id")));
			}
			for(Integer qid : questionids){
				this.jdbcTemplate.update(
						"UPDATE question SET displayQuestionno ="+qno+++" WHERE id ="+qid);
			}
		}
		
	}

	private void addOptions(int qid) {
		for(int i=0; i<5; i++){
			jdbcTemplate
			.update("INSERT INTO option (value, questionid) VALUES('',"
					+ qid + ")");
		}
		
	}

	public List<UserProfile> getUserDetails() {
		
		List<UserProfile> users = new ArrayList<UserProfile>();
		
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				"SELECT userid from section where testid=2 order by id");
		return null;
	}

	public void calculateResult() {

		List<UserProfile> users = getUserDetails();
		
		for(UserProfile user : users){
			
			updateUserResult(user);		
			
		}
		
	}

	private void updateUserResult(UserProfile user) {
		
		this.jdbcTemplate.update("", user.getId());
		
	}
}
