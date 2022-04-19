package com.test.theacademy.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.test.theacademy.model.Feedback;
import com.test.theacademy.model.Question;
import com.test.theacademy.model.Section;
import com.test.theacademy.model.TestDetails;
import com.test.theacademy.model.UserAnswer;
import com.test.theacademy.model.UserProfile;
import com.test.theacademy.model.UserSection;
import com.test.theacademy.model.UserTestDetails;

@Repository
public class UserDAO {

	@Autowired
	private UserProfile userProfile;
	@Autowired
	private TestDAO testDAO;

	private JdbcTemplate jdbcTemplate;
	private static final String USER_DETAILS = "SELECT * FROM user WHERE id = ?";
	private static final String USER_ID = "SELECT id FROM user where rollno =?";
	private static final String ADD_USER_DETAILS = "INSERT INTO user (`firstname`, `lastname`, `email`, `mobile`, `gender`, `dob`,"
			+ "`rollno`,`password`) " + "VALUES (?,?,?,?,?,?,?, 'admin' )";
	private static final String VALIDATE_LOGIN = "SELECT * FROM user where rollno = ? AND password = ?";
	private static final String MAX_ROLLNO = "SELECT max(rollno) rollno FROM user";
	private static final String UPDATE_USER_ANSWER = "INSERT into useranswerdetails "
			+ "(`questionid`, `answerstatus`, `userid`) VALUES ( ?, 'unattempt', ?)";
	private static final String UPDATE_USER_SECTION = "INSERT into usersectiondetails (`userid`, `sectionid`, `timeleft`) "
			+ "VALUES (?, ?, ?)";
	private static final String UPDATE_USER_TEST = "INSERT into usertestdetails (`userid`, `testid`, `timeleft`) VALUES "
			+ "(?, ?, ?)";

	private static final String GET_SECTION_DETAILS = "SELECT answerstatus FROM `useranswerdetails`,"
			+ " `question` WHERE question.id =useranswerdetails.questionid and userid = ? AND sectionid = ?";

	private static final String TOTAL_ATTEMPTED = "SELECT count(*) FROM `useranswerdetails` where userid=? AND "
			+ "answerstatus in('attempt','qno_ans_tag')";
	
	private static final String TOTAL_UNATTEMPTED = "SELECT count(*) FROM `useranswerdetails` where userid=? AND "
			+ "answerstatus not in('attempt','qno_ans_tag')";

	private static final String SUBMIT_FEEDBACK = "INSERT INTO feedback";

	@Autowired
	public void setDataSource(@Qualifier("dataSource") DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("Connectes to database");
	}

	public int registerUser(UserProfile user) {
		Integer mrollno = jdbcTemplate.queryForObject(MAX_ROLLNO,
				new Object[] {}, new RowMapper<Integer>() {
					public Integer mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						return rs.getInt("rollno");
					}
				});
		jdbcTemplate
				.update(ADD_USER_DETAILS,
						new Object[] { user.getFirstName(), user.getLastName(),
								user.getEmailID(), user.getMobileNo(),
								user.getGender(), user.getDob(), mrollno + 1 },
						new int[] { Types.VARCHAR, Types.VARCHAR,
								Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
								Types.DATE, Types.INTEGER });
		return mrollno + 1;
	}

	public UserProfile validateLogin(Integer rollno, String password) {
		UserProfile user = null;

		try {
			user = jdbcTemplate.queryForObject(VALIDATE_LOGIN, new Object[] {
					rollno, password }, new RowMapper<UserProfile>() {
				public UserProfile mapRow(ResultSet rs, int rowNum)
						throws SQLException {
					UserProfile userDetails = new UserProfile();
					userDetails.setId(rs.getInt("Id"));
					userDetails.setEmailID(rs.getString("Email"));
					userDetails.setPassword(rs.getString("Password"));
					userDetails.setFirstName(rs.getString("FirstName"));
					userDetails.setLastName(rs.getString("LastName"));
					userDetails.setMobileNo(rs.getString("mobile"));
					userDetails.setRollno(rs.getInt("rollno"));
					userDetails.setIsTestSetup(rs.getString("istestsetup"));
					userDetails.setDefaultLanguage(rs
							.getString("defaultLanguage"));
					return userDetails;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

	public UserProfile getUserDetails(int userId) {

		UserProfile user = null;

		try {
			user = jdbcTemplate.queryForObject(USER_DETAILS,
					new Object[] { userId }, new RowMapper<UserProfile>() {
						public UserProfile mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							UserProfile userDetails = new UserProfile();
							userDetails.setId(rs.getInt("Id"));
							userDetails.setEmailID(rs.getString("Email"));
							userDetails.setPassword(rs.getString("Password"));
							userDetails.setFirstName(rs.getString("FirstName"));
							userDetails.setLastName(rs.getString("LastName"));
							userDetails.setMobileNo(rs.getString("mobile"));
							userDetails.setRollno(rs.getInt("rollno"));
							userDetails.setIsTestSetup(rs
									.getString("istestsetup"));
							userDetails.setDefaultLanguage(rs
									.getString("defaultLanguage"));
							return userDetails;
						}
					});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

	public void setupTest(UserProfile user, int testid) {

		int userid = jdbcTemplate.queryForObject(USER_ID,
				new Object[] { user.getRollno() }, new RowMapper<Integer>() {
					public Integer mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						return rs.getInt("id");
					}
				});
		user.setId(userid);
		TestDetails test = testDAO.getTestDetails(testid);

		List<Section> sections = test.getSections();

		for (Section section : sections) {

			List<Question> questions = section.getQuestions();
			this.jdbcTemplate.update(
					UPDATE_USER_SECTION,
					new Object[] { user.getId(), section.getId(),
							section.getDuration() });
			for (Question q : questions) {
				this.jdbcTemplate.update(UPDATE_USER_ANSWER,
						new Object[] { q.getId(), user.getId() });
			}
		}
		this.jdbcTemplate.update("update user set istestsetup='yes' where id="
				+ user.getId());
		this.jdbcTemplate.update(UPDATE_USER_TEST, new Object[] { user.getId(),
				testid, test.getDuration() });
	}

	public void updateDefaultLanguage(String defaultLanguage, Integer userId) {
		this.jdbcTemplate.update("update user set defaultLanguage ='"
				+ defaultLanguage + "' where id=" + userId);
	}

	public void setActiveSection(int sectionid, int userid) {
		this.jdbcTemplate.update("update usertestdetails set activesection ="
				+ sectionid + " where userid=" + userid);

	}

	public void updateTimer(Integer timeleft, Integer userId) {
		this.jdbcTemplate.update("update usertestdetails set timeleft ="
				+ timeleft + " WHERE userid =" + userId);

	}

	public UserTestDetails getTestDetails(Integer userId) {

		UserTestDetails details = new UserTestDetails();
		/*List<UserSection> sections = new ArrayList<UserSection>();
		UserSection section;
		List<Map<String, Object>> rows = this.jdbcTemplate
				.queryForList("SELECT distinct id from section");
		for (Map<String, Object> row : rows) {
			Integer id = (Integer) (row.get("id"));
			section = getUserSection(userId, id);
			sections.add(section);
		}
		details.setUserSections(sections);*/
		Integer attempt =0, unattempt =0;
		
		try {
			attempt = jdbcTemplate.queryForObject(TOTAL_ATTEMPTED,
					new Object[] { userId }, Integer.class);
			
			unattempt = jdbcTemplate.queryForObject(TOTAL_UNATTEMPTED,
					new Object[] { userId }, Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		details.setTotalAttempted(attempt);
		details.setTotalUnAttempted(unattempt);
		return details;
	}

	public UserSection getUserSection(int userID, int sectionId) {
		UserSection section = new UserSection();
		int answered = 0, notAnswered = 0, marked = 0, markedAndReview = 0, notVisited = 0;
		;

		List<Map<String, Object>> rows = this.jdbcTemplate.queryForList(
				GET_SECTION_DETAILS, new Object[] { userID, sectionId });
		for (Map<String, Object> row : rows) {

			UserAnswer u = new UserAnswer();

			String status = (String) (row.get("answerstatus"));
			u.setqStatus(status);
			if (status.equalsIgnoreCase("attempt")) {
				answered++;
			} else if (status.equalsIgnoreCase("unattempt")) {
				notAnswered++;
			} else if (status.equalsIgnoreCase("qnodisp_tag")) {
				marked++;
			} else if (status.equalsIgnoreCase("qno_ans_tag")) {
				markedAndReview++;
			} else {
				notVisited++;
			}
		}
		section.setId(sectionId);
		section.setAnswered(answered);
		section.setNotAnswered(notAnswered);
		section.setMarked(marked);
		section.setAnsweredAndMarked(markedAndReview);
		section.setNotVisited(notVisited);
		section.setTotalQuestions(rows.size());
		String name = "";
		try {
			name = jdbcTemplate.queryForObject(
					"SELECT name FROM section WHERE id =?",
					new Object[] { sectionId }, String.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		section.setName(name);
		return section;
	}

	public void submitFeedback(Integer userid, Feedback fb) {
		// TODO Auto-generated method stub

	}

}
