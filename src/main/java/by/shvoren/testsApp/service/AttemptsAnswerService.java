package by.shvoren.testsApp.service;

import by.shvoren.testsApp.repo.AttemptAnswerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttemptsAnswerService {

    @Autowired
    private AttemptAnswerRepo repo;

    public void setAttemptAnswer(Integer attemptId,Integer questionID,Integer selectedOptionId){
        repo.setAttemptAnswer(attemptId,questionID,selectedOptionId);
    }
}
