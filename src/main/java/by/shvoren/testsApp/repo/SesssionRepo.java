package by.shvoren.testsApp.repo;

import by.shvoren.testsApp.DAO.ExamneeSessionsDTO;
import by.shvoren.testsApp.DAO.SessionSubjectDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SesssionRepo {

    @Autowired
    private JdbcTemplate template;


    public List<ExamneeSessionsDTO> getExamneeSessions(Integer examneeId) {
        String sql = """
        SELECT
                        es.id AS sessionId,
                        ec.name AS centerName,
                        es.session_date AS sessionDate,
                        esss.name AS status,
                        s.name AS subjectName,
                        t.title AS testName
                    FROM exam_registrations er
                    JOIN exam_sessions es ON er.session_id = es.id
                    JOIN exam_centers ec ON es.center_id = ec.id
                    JOIN exam_session_status esss ON esss.id = es.exam_session_status_id
                    JOIN exam_sessions_subjects ess ON ess.session_id = es.id
                    JOIN subjects s ON s.id = ess.subject_id
                    JOIN tests t ON t.id = ess.test_id
                    WHERE er.examinee_id = ?
                    ORDER BY es.session_date DESC;
    """;

        Map<Integer, ExamneeSessionsDTO> map = new LinkedHashMap<>();

        template.query(sql, new Object[]{examneeId}, rs -> {
            Integer sessionId = rs.getInt("sessionId");

            ExamneeSessionsDTO session = map.get(sessionId);
            if (session == null) {
                session = new ExamneeSessionsDTO();
                session.setSessionId(sessionId);
                session.setCenterName(rs.getString("centerName"));
                session.setSessionDate(rs.getString("sessionDate"));
                session.setStatus(rs.getString("status"));
                session.setSubjects(new ArrayList<>());

                map.put(sessionId, session);
            }

            SessionSubjectDTO subject = new SessionSubjectDTO();
            subject.setSubjectName(rs.getString("subjectName"));
            subject.setTestName(rs.getString("testName"));

            session.getSubjects().add(subject);
        });

        return new ArrayList<>(map.values());
    }
}
