package com.test.theacademy.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.test.theacademy.model.Option;
import com.test.theacademy.model.Question;
import com.test.theacademy.model.Section;
import com.test.theacademy.model.TestDetails;

@Repository
public class TestDAO {

	Section section;
	private JdbcTemplate jdbcTemplate;
	
	private static final String TEST_DETAILS = "SELECT * FROM test where id =?";
	private static final String ALL_SECTIONS_BY_TESTID = "SELECT * FROM section where testid =?";
	private static final String ALL_QUESTIONS_BY_SECTIONID = "SELECT * FROM question where sectionid =?";
	private static final String SECTION_DETAILS ="SELECT * FROM section where id =?";
	private static final String QUESTION_BY_NO = "SELECT question.id, question.name_hindi, question.name, question.type,"
			+ "question.file, question.paragraph, question.paragraph_hindi, question.displayQuestionno, "
			+ "useranswerdetails.optionmarked FROM question, useranswerdetails WHERE question.id =useranswerdetails.questionid"
			+ " and useranswerdetails.userid =? and question.displayQuestionno =? and question.sectionid = ?";
	
	private static final String QUESTION_BY_ID ="SELECT question.id, question.name_hindi, question.name, question.type,"
			+ "question.file, question.paragraph, question.paragraph_hindi, question.displayQuestionno, "
			+ "useranswerdetails.optionmarked FROM question, useranswerdetails WHERE question.id =useranswerdetails.questionid"
			+ " and useranswerdetails.userid =?"
			+ " and question.id=?";
	private static final String GET_OPTIONS = "SELECT * FROM `option` WHERE questionid = ?";

	@Autowired
	public void setDataSource(@Qualifier("dataSource") DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("Connected to database");
	}

	public Question getQuestionById(int questionId, int userId){
		Question question = null;

		try {
			question = jdbcTemplate.queryForObject(QUESTION_BY_ID,
					new Object[] { userId, questionId }, new RowMapper<Question>() {
						public Question mapRow(ResultSet rs, int rowNum)
								throws SQLException {

							Question q = new Question();
							q.setId(rs.getInt("id"));
							q.setQuestion(rs.getString("name"));
							q.setType(rs.getString("type"));
							q.setQuestionno(rs.getInt("displayQuestionno"));
							q.setOptionMarked(rs.getInt("optionmarked"));
							q.setqHindi(rs.getString("name_hindi"));
							q.setFilepath(rs.getString("file"));
							q.setParagraph(rs.getString("paragraph"));
							q.setpHindi(rs.getString("paragraph_hindi"));
							return q;
						}
					});

		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Option> options = getOptions(question.getId());
		question.setOptions(options);

		return question;
	}
	
	public Question getQuestion(int questionno, int sectionid, int userId) {
		Question question = null;

		try {
			question = jdbcTemplate.queryForObject(QUESTION_BY_NO,
					new Object[] { userId, questionno, sectionid }, new RowMapper<Question>() {
						public Question mapRow(ResultSet rs, int rowNum)
								throws SQLException {

							Question q = new Question();
							q.setId(rs.getInt("id"));
							q.setQuestion(rs.getString("name"));
							q.setType(rs.getString("type"));
							q.setQuestionno(rs.getInt("displayQuestionno"));
							q.setOptionMarked(rs.getInt("optionmarked"));
							q.setqHindi(rs.getString("name_hindi"));
							q.setFilepath(rs.getString("file"));
							q.setParagraph(rs.getString("paragraph"));
							q.setpHindi(rs.getString("paragraph_hindi"));
							return q;
						}
					});

		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Option> options = getOptions(question.getId());
		question.setOptions(options);

		return question;
	}

	private List<Option> getOptions(int questionID) {

		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				GET_OPTIONS, new Object[] { questionID });
		List<Option> options = new ArrayList<Option>();
		for (Map<String, Object> row : rows) {
			Option o =new Option();
			o.setKey((Integer)row.get("id"));
			o.setValue((String) (row.get("value")));
			o.setValueHindi((String)row.get("value_hindi"));
			o.setFilepath((String)row.get("filepath"));
			options.add(o);
		}
		return options;
	}

	public Question getParticularQuestion(int i) {
		return section.getQuestions().get(i - 1);
	}
	
	
	public TestDetails getTestDetails(final int testid) {
		// TODO Auto-generated method stub
		TestDetails test;
		try {
			test = jdbcTemplate.queryForObject(TEST_DETAILS,
					new Object[] { testid }, new RowMapper<TestDetails>() {
						public TestDetails mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							TestDetails test = new TestDetails();
							test.setId((rs.getInt("id")));
							test.setName(rs.getString("name"));
							test.setDuration(rs.getInt("duration"));
							test.setTotalMarks(rs.getInt("totalMarks"));
							test.setTotalSections(rs.getInt("totalSection"));
							
							test.setSections(getSections(testid));
							return test;
						}
					});
			Integer maxSctnId =jdbcTemplate.queryForObject(
					"SELECT max(id) FROM section WHERE testid=?",
					new Object[] { testid }, Integer.class);
			test.setMaxSectionId(maxSctnId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return test;
	}

	public List<Question> getQuestions(int sectionid) {
		// TODO Auto-generated method stub
		List<Question> questions = new ArrayList<Question>();
		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				ALL_QUESTIONS_BY_SECTIONID, new Object[] { sectionid });
		for (Map<String, Object> row : rows) {
			Question q = new Question();
			q.setId((Integer) (row.get("id")));
			q.setQuestion((String)row.get("name"));
			q.setType((String)row.get("type"));
			q.setQuestionno((Integer)row.get("displayQuestionno"));
			q.setAnswer((String)row.get("answer"));
			q.setqHindi((String)row.get("name_hindi"));
			q.setMarks((Integer)row.get("marks"));
			q.setFilepath((String)row.get("file"));
			q.setParagraph((String)row.get("paragraph"));
			q.setpHindi((String)(row.get("paragraph_hindi")));
			q.setOptionId((Integer)row.get("optionid"));
			List<Option> options =getOptions(q.getId());
			
			q.setOptions(options);
			questions.add(q);
		}
		return questions;
	}

	private List<Section> getSections(int testid) {
		// TODO Auto-generated method stub
		List<Section> sections = new ArrayList<Section>();

		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				ALL_SECTIONS_BY_TESTID, new Object[] { testid });
		for (Map<String, Object> row : rows) {
			Section s = new Section();
			s.setId((Integer) (row.get("id")));
			s.setName((String) (row.get("name")));
			s.setDuration((Integer) (row.get("duration")));
			s.setTotalQuestions((Integer)row.get("totalQuestions"));
			s.setTotalMarks((Integer)row.get("totalMarks"));
			s.setQuestions(getQuestions(s.getId()));
			sections.add(s);
		}
		return sections;
	}

	public Section getsectionDetails(int sectionid){
		Section section;
		try {
			section = jdbcTemplate.queryForObject(SECTION_DETAILS,
					new Object[] { sectionid }, new RowMapper<Section>() {
						public Section mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							Section s=new Section();
							s.setId((rs.getInt("id")));
							s.setName(rs.getString("name"));
							s.setDuration(rs.getInt("duration"));
							s.setTotalQuestions(rs.getInt("totalQuestions"));
							s.setTotalMarks(rs.getInt("totalMarks"));
							s.setQuestions(getQuestions(s.getId()));
							return s;
						}
					});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return section;
	}

	public boolean isLastQuestion(Integer questionno, Integer sectionId) {

		Integer totalQuestion =0;
		try {
		totalQuestion =jdbcTemplate.queryForObject(
				"SELECT totalQuestions FROM section WHERE id=?",
				new Object[] { sectionId }, Integer.class);
		}catch(Exception e){e.printStackTrace();
			
		}
		return totalQuestion ==questionno;
	}

	public int getTotalQuestions(int sectionid) {
		Integer totalQuestion =0;
		try {
		totalQuestion =jdbcTemplate.queryForObject(
				"SELECT totalQuestions FROM section WHERE id=?",
				new Object[] { sectionid }, Integer.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return totalQuestion;
	}

	public int getStartingQuestionNo(Integer sectionId) {
		// TODO Auto-generated method stub
		int qno =jdbcTemplate.queryForObject(
				"SELECT min(displayQuestionno) FROM question WHERE sectionid=?",
				new Object[] { sectionId }, Integer.class);
		return qno;
	}

	public int getLastQuestions(int sectionid) {
		int qno =jdbcTemplate.queryForObject(
				"SELECT max(displayQuestionno) FROM question WHERE sectionid=?",
				new Object[] { sectionid }, Integer.class);
		return qno;
	}

	public int getFirstSectionId(Integer testid) {

		int sectionid =jdbcTemplate.queryForObject(
				"SELECT min(id) FROM section WHERE testid=?",
				new Object[] { testid }, Integer.class);
		return sectionid;
	}
}
