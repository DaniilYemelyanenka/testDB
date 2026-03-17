package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.AttemptAnswerDTO;
import by.shvoren.testsApp.service.AttemptsAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/attempt-answer")
public class AttemptAnswerController {

    @Autowired
    private AttemptsAnswerService service;

    @PostMapping("")
    public ResponseEntity<String> saveAttemptAnswer(@RequestBody AttemptAnswerDTO answerDTO){

        System.out.println("Answ: -"+ answerDTO.getAttemptId()+" " + answerDTO.getQuestionId()+ " " + answerDTO.getSelectedOptionId());
        service.setAttemptAnswer(answerDTO.getAttemptId(),
                                 answerDTO.getQuestionId(),
                                 answerDTO.getSelectedOptionId());
        return ResponseEntity.ok("success");
    }
}
