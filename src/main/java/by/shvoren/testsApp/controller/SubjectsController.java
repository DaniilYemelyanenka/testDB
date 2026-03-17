package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.SubjectsScoresDTO;
import by.shvoren.testsApp.service.SubjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@RequestMapping("api/v1/subjects")
public class SubjectsController {

    @Autowired
    private SubjectService service;

    @GetMapping("/subjects-scores")
    public ResponseEntity<List<SubjectsScoresDTO>> getSubjectsScores(){
        log.info("Request to get subjects scores by {}","admin");
        List<SubjectsScoresDTO> list = service.getSubjectScores();
        return ResponseEntity.ok(list);
    }
}
