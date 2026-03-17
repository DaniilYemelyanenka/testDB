package by.shvoren.testsApp.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AttemptAnswerRepo {

    @Autowired
    private JdbcTemplate template;

    public void setAttemptAnswer(Integer attemptId,Integer questionID,Integer selectedOptionId){
        template.update("INSERT INTO participants_answers (attempt_id,question_id,selected_option_id) VALUES (?,?,?)",
                attemptId,questionID,selectedOptionId);
    }
}
