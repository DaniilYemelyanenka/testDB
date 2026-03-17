package by.shvoren.testsApp.service;

import by.shvoren.testsApp.repo.AttemptRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class AttemptsService {

    @Autowired
    private AttemptRepo repo;

    public Integer startAttempt(Integer testId,Integer examRegistrationId) {
        return repo.addAttempt(testId,examRegistrationId);
    }

    public void finishAttempt(Integer attemptId) {
        repo.finishAttempt(attemptId);
    }

    public void addToTestResults(Integer attemptId) {
        repo.addToTestsResults(attemptId);
    }
}
