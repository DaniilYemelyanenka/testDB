package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.CheckAnswerDTO;
import by.shvoren.testsApp.DAO.TestDTO;
import by.shvoren.testsApp.service.TestsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("api/tests")
public class TestsController {

    @Autowired
    private TestsService testsService;

    @GetMapping("/{id}")
    public ResponseEntity<TestDTO> getTestData(@PathVariable Integer id){
        log.info("Request for getting test data ");
        TestDTO testDto = testsService.getTestData(id);
        return ResponseEntity.ok(testDto);
    }

    @PostMapping("check-answer")
    public ResponseEntity<Boolean> checkAnswer(@RequestBody CheckAnswerDTO checkAnswerDTO){
        log.info("Request to check answer");
        log.info("check-answer {} , {} ",checkAnswerDTO.getQuestionId(),checkAnswerDTO.getSelectedOptionId());
        System.out.println("check-answer "+checkAnswerDTO.getQuestionId()+checkAnswerDTO.getSelectedOptionId());
        boolean result = testsService.checkAnswer(checkAnswerDTO.getQuestionId(),checkAnswerDTO.getSelectedOptionId());
        return ResponseEntity.ok(result);
    }
}
