package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.FinishAttemptDTO;
import by.shvoren.testsApp.DAO.StartAttemptDTO;
import by.shvoren.testsApp.service.AttemptsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("api/test-attempts")
public class AttemptsController {

    @Autowired
    private AttemptsService service;

    @PostMapping("/start")
    public ResponseEntity<Integer> startAttempt(@RequestBody StartAttemptDTO attemptDTO){
        Integer attemptId = service.startAttempt(attemptDTO.getTestId(),attemptDTO.getExamRegistrationId());
        return ResponseEntity.ok(attemptId);
    }

    @PostMapping("/finish")
    public ResponseEntity<String> finishAttempt(@RequestBody FinishAttemptDTO attemptDTO){
        service.finishAttempt(attemptDTO.getAttemptId());
        service.addToTestResults(attemptDTO.getAttemptId());
        //TODO add to test results
        return ResponseEntity.ok("success");
    }
}
