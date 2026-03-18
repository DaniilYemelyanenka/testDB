package by.shvoren.testsApp.controller;

import by.shvoren.testsApp.DAO.ExamneeSessionsDTO;
import by.shvoren.testsApp.DAO.ExamneeTestsDTO;
import by.shvoren.testsApp.service.SessionService;
import by.shvoren.testsApp.service.TestsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/examnee")
public class ExamneeController {

    @Autowired
    private TestsService testsService;

    @Autowired
    private SessionService sessionService;

    @GetMapping("/tests")
    public ResponseEntity<List<ExamneeTestsDTO>> getExamneeTests(){
        List<ExamneeTestsDTO> list = testsService.getTestsListByExamneeEmail("bob@example.com");
        return ResponseEntity.ok(list);
    }

    @GetMapping("/sessions")
    public ResponseEntity<List<ExamneeSessionsDTO>> getExamneeSessionsDTO(){
        List<ExamneeSessionsDTO> list = sessionService.getExamneeSessionsDTO("email");
        return ResponseEntity.ok(list);
    }
}
