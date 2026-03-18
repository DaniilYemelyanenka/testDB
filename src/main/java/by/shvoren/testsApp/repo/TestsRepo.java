package by.shvoren.testsApp.repo;

import by.shvoren.testsApp.DAO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class TestsRepo {

    @Autowired
    private JdbcTemplate template;

    public TestDTO getTestById(Integer id){
        String sql = """
                SELECT 
                    t.id AS test_id,
                    t.title AS test_title,
                    t.duration_minutes,
                    s.name AS subject_name,
                    
                    q.id AS question_id,
                    q.question_text,
                    q.score,
                    
                    a.id AS answer_id,
                    a.option_text AS answer_text
                FROM tests t
                JOIN subjects s ON t.subject_id = s.id
                JOIN questions q ON q.test_id = t.id
                LEFT JOIN answer_options a ON a.question_id = q.id
                WHERE t.id = ?
                ORDER BY q.id, a.id;
                """;

        List<Map<String, Object>> rows = template.queryForList(sql, id);

        TestDTO test = new TestDTO();
        Map<Integer, QuestionsDTO> questionsMap = new LinkedHashMap<>();

        for (Map<String, Object> row : rows) {

            if (test.getTitle() == null) {
                test.setId((Integer) row.get("test_id"));
                test.setTitle((String) row.get("test_title"));
                test.setSubjectName((String) row.get("subject_name"));
                test.setDurationMinutes((Integer) row.get("duration_minutes"));
                test.setQuestionsList(new ArrayList<>());
            }

            Integer questionId = (Integer) row.get("question_id");

            QuestionsDTO question = questionsMap.get(questionId);

            if (question == null) {
                question = new QuestionsDTO();
                question.setId(questionId);
                question.setQuestionText((String) row.get("question_text"));
                question.setScore((Integer) row.get("score"));
                question.setAnswersList(new ArrayList<>());

                questionsMap.put(questionId, question);
                test.getQuestionsList().add(question);
            }

            Integer answerId = (Integer) row.get("answer_id");

            if (answerId != null) {
                AnswerDTO answer = new AnswerDTO();
                answer.setId(answerId);
                answer.setText((String) row.get("answer_text"));

                question.getAnswersList().add(answer);
            }
        }

        return test;
    }

    public boolean checkAnswer(Integer questionId, Integer selectedOptionId) {
        String sql = "SELECT is_correct FROM answer_options WHERE question_id = ? AND id = ?";

        try {
            Boolean result = template.queryForObject(
                    sql,
                    new Object[]{questionId, selectedOptionId},
                    Boolean.class
            );
            return Boolean.TRUE.equals(result);

        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    public List<AvgScoreDateDTO> getAvgScoreByDates() {
        String sql = """
                SELECT
                    es.session_date,
                    AVG(tr.total_score) AS avg_score
                FROM test_results tr
                JOIN test_attempts ta ON tr.attempt_id = ta.id
                JOIN exam_registrations er ON ta.exam_registration_id = er.id
                JOIN exam_sessions es ON er.session_id = es.id
                GROUP BY es.session_date
                ORDER BY es.session_date;
                """;
        return template.query(sql,(rs, rowNum) -> new AvgScoreDateDTO(
                rs.getDate("session_date"),
                rs.getInt("avg_score")
        ));
    }

    public List<TestsTimeDTO> getTestsTimesList() {
        String sql = """
                SELECT
                    t.title,
                    AVG(EXTRACT(EPOCH FROM (ta.end_time - ta.start_time))/60) AS avg_minutes
                FROM test_attempts ta
                JOIN tests t ON ta.test_id = t.id
                WHERE ta.end_time IS NOT NULL
                GROUP BY t.title;
                """;
        return template.query(sql,(rs,rowNum) -> new TestsTimeDTO(
                rs.getString("title"),
                rs.getInt("avg_minutes")
        ));
    }

    public List<ExamneeTestsDTO> getTestByExamneeId(Integer examneeId) {
        String sql = """
                SELECT
                    t.id AS testId,
                    t.title AS testName,
                    s.name AS subject,
                    CASE
                        WHEN ta.id IS NULL THEN 'NOT_STARTED'
                        WHEN ta.id IS NOT NULL AND tr.id IS NULL THEN 'IN_PROGRESS'
                        WHEN tr.total_score >= 8 THEN 'PASSED'
                        WHEN tr.total_score < 8 THEN 'FAILED'
                    END AS status,
                               
                    tr.total_score AS score
                               
                FROM examinees e
                JOIN exam_registrations er ON er.examinee_id = e.id
                JOIN exam_sessions es ON er.session_id = es.id
                JOIN exam_sessions_subjects ess ON ess.session_id = es.id
                JOIN tests t ON t.id = ess.test_id
                JOIN subjects s ON s.id = t.subject_id
                               
                LEFT JOIN test_attempts ta
                    ON ta.test_id = t.id AND ta.exam_registration_id = er.id
                               
                LEFT JOIN test_results tr
                    ON tr.attempt_id = ta.id
                               
                WHERE e.id = ?
                ORDER BY es.session_date DESC, t.title;
                """;
        return template.query(sql,(rs, rowNum) -> new ExamneeTestsDTO(
                rs.getInt("testId"),
                rs.getString("testName"),
                rs.getString("subject"),
                rs.getString("status"),
                rs.getInt("score")
        ),examneeId);
    }
}
