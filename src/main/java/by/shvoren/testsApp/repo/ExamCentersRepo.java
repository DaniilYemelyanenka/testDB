package by.shvoren.testsApp.repo;

import by.shvoren.testsApp.DAO.ShortExamCentersDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExamCentersRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ShortExamCentersDTO> getShortExamCentersInfo(){
        String sql = """
                SELECT
                    ec.id AS centerID,
                    ec.name,
                    ec.city,
                    ec.capacity,
                    COUNT(DISTINCT e.id) AS totalExaminees,
                    COUNT(DISTINCT es.id) FILTER (WHERE es.session_date >= CURRENT_DATE) AS upcomingSessions,
                    COUNT(DISTINCT er.id) FILTER (WHERE er.status = 'Registered') AS activeRegistrations,
                    u.is_active AS active 
                FROM exam_centers ec
                LEFT JOIN exam_sessions es ON es.center_id = ec.id
                LEFT JOIN exam_registrations er ON er.session_id = es.id
                LEFT JOIN examinees e ON er.examinee_id = e.id
                LEFT JOIN users u ON u.id = ec.user_id
                GROUP BY ec.id, ec.name, ec.city, ec.capacity,u.is_active
                ORDER BY ec.name;
                """;
        return jdbcTemplate.query(sql,(rs,rowNum) -> new ShortExamCentersDTO(
                rs.getInt("centerID"),
                rs.getString("name"),
                rs.getString("city"),
                rs.getInt("capacity"),
                rs.getInt("totalExaminees"),
                rs.getInt("upcomingSessions"),
                rs.getInt("activeRegistrations"),
                rs.getBoolean("active")
        ));
    }
}
