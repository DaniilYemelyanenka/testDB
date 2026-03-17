package by.shvoren.testsApp.repo;

import by.shvoren.testsApp.DAO.ShortExamneeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExamneeRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<ShortExamneeDTO> getShortExamneeInfo(){
        String sql = """
                SELECT
                    e.id AS examneeID,
                    u.first_name AS firstName,
                    u.last_name AS lastName,
                    u.is_active AS isActive,
                    COUNT(DISTINCT er.id) FILTER (WHERE er.status = 'Registered') AS activeRegistrations,
                    COUNT(a.id) AS totalAppeals
                FROM examinees e
                JOIN users u ON e.user_id = u.id
                LEFT JOIN exam_registrations er ON er.examinee_id = e.id
                LEFT JOIN test_attempts ta ON ta.exam_registration_id = er.id
                LEFT JOIN appeals a ON a.attempt_id = ta.id
                GROUP BY e.id, u.first_name, u.last_name, u.is_active
                ORDER BY u.last_name, u.first_name;
                """;
        return  jdbcTemplate.query(sql,(rs, rowNum) -> new ShortExamneeDTO(
                rs.getInt("examneeID"),
                rs.getString("firstName"),
                rs.getString("lastName"),
                rs.getBoolean("isActive"),
                rs.getInt("activeRegistrations"),
                rs.getInt("totalAppeals")
        ));
    }
}
