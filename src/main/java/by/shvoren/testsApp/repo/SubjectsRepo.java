package by.shvoren.testsApp.repo;

import by.shvoren.testsApp.DAO.SubjectsScoresDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectsRepo {

    @Autowired
    private JdbcTemplate template;

    public List<SubjectsScoresDTO> getSubjectsScores(){
        String sql = """
                WITH subject_scores AS (
                    SELECT
                        u.id AS user_id,
                        u.first_name,
                        u.last_name,
                        s.name AS subject,
                        SUM(tr.total_score) AS total_score
                    FROM test_results tr
                    JOIN test_attempts ta ON tr.attempt_id = ta.id
                    JOIN exam_registrations er ON ta.exam_registration_id = er.id
                    JOIN examinees e ON er.examinee_id = e.id
                    JOIN users u ON e.user_id = u.id
                    JOIN tests t ON ta.test_id = t.id
                    JOIN subjects s ON t.subject_id = s.id
                    GROUP BY u.id, u.first_name, u.last_name, s.name
                )
                SELECT *,
                       RANK() OVER (PARTITION BY subject ORDER BY total_score DESC) AS rank
                FROM subject_scores;
                """;
        return template.query(sql,(rs,rowNum) -> new SubjectsScoresDTO(
                rs.getInt("user_id"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("subject"),
                rs.getInt("total_score")
        ));
    }
}
