package by.shvoren.testsApp.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
public class AttemptRepo {

    @Autowired
    private JdbcTemplate template;

    public Integer addAttempt(Integer testId, Integer examRegistrationId) {
        String sql = "INSERT INTO test_attempts (test_id,exam_registration_id) VALUES (?,?) RETURNING id";
        return template.queryForObject(sql, new Object[] {testId,examRegistrationId}, Integer.class);
    }

    public void finishAttempt(Integer attemptId) {
        String sql = "UPDATE test_attempts SET end_time = NOW() WHERE id = ?";

        template.update(sql, attemptId);
    }

    public void addToTestsResults(Integer attemptId) {
        String sql = """
                INSERT INTO test_results (attempt_id, total_score, passed, calculated_at)
                SELECT
                    pa.attempt_id,
                    SUM(q.score) as total_score,
                    SUM(CASE WHEN ao.is_correct THEN q.score ELSE 0 END) >= 50 as passed,
                    NOW()
                FROM participants_answers pa
                JOIN questions q ON pa.question_id = q.id
                JOIN answer_options ao ON pa.selected_option_id = ao.id
                WHERE pa.attempt_id = ?
                GROUP BY pa.attempt_id
                ON CONFLICT (attempt_id)
                DO UPDATE SET
                    total_score = EXCLUDED.total_score,
                    passed = EXCLUDED.passed,
                    calculated_at = NOW();
                """;
        template.update(sql,attemptId);
    }
}
