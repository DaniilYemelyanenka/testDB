package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.AvgScoreDateDTO;
import by.shvoren.testsApp.DAO.ShortExamCentersDTO;
import by.shvoren.testsApp.DAO.ShortExamneeDTO;
import by.shvoren.testsApp.DAO.TestsTimeDTO;
import by.shvoren.testsApp.service.ExamCentersService;
import by.shvoren.testsApp.service.ExamneeServie;
import by.shvoren.testsApp.service.TestsService;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/admin")
@Slf4j
public class AdminController {

    @Autowired
    private ExamneeServie examneeServie;

    @Autowired
    private TestsService testsService;

    @Autowired
    private ExamCentersService examCentersService;

    @GetMapping("/examinees")
    public ResponseEntity<List<ShortExamneeDTO>> getShortExamneeInfo(){
        log.info("Request for getting short info about examnees by {}", "admin");
        List<ShortExamneeDTO> list = examneeServie.getShortExamneeInfo();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/exam-centers")
    public ResponseEntity<List<ShortExamCentersDTO>> getShortExamCentersInfo(){
        log.info("Request for getting short info about exam centers by {}", "admin");
        List<ShortExamCentersDTO> list = examCentersService.getShortExamCentersInfo();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/avg-score-by-date")
    public ResponseEntity<List<AvgScoreDateDTO>> getAvgScoreByDates(){
        log.info("Request for getting average score by date");
        List<AvgScoreDateDTO> list = testsService.getAvgScoreByDates();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/tests-time")
    public ResponseEntity<List<TestsTimeDTO>> getTestsTime(){
        log.info("Request for getting average time at test");
        List<TestsTimeDTO> list = testsService.getTestsTimesList();
        return ResponseEntity.ok(list);
    }
}
