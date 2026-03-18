package by.shvoren.testsApp.service;

import by.shvoren.testsApp.DAO.AvgScoreDateDTO;
import by.shvoren.testsApp.DAO.ExamneeTestsDTO;
import by.shvoren.testsApp.DAO.TestDTO;
import by.shvoren.testsApp.DAO.TestsTimeDTO;
import by.shvoren.testsApp.repo.TestsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestsService {

    @Autowired
    private TestsRepo repo;

//    @Autowired
//    private UserService userService;

    public TestDTO getTestData(Integer id){
        return repo.getTestById(id);
    }

    public Boolean checkAnswer(Integer questionId, Integer selectedOptionId) {
        return repo.checkAnswer(questionId,selectedOptionId);
    }

    public List<AvgScoreDateDTO> getAvgScoreByDates() {
        return repo.getAvgScoreByDates();
    }

    public List<TestsTimeDTO> getTestsTimesList() {
        return repo.getTestsTimesList();
    }

    public List<ExamneeTestsDTO> getTestsListByExamneeEmail(String mail) {
        return repo.getTestByExamneeId(2);
    }
}
