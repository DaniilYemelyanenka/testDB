package by.shvoren.testsApp.service;

import by.shvoren.testsApp.DAO.ShortExamCentersDTO;
import by.shvoren.testsApp.repo.ExamCentersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamCentersService {

    @Autowired
    private ExamCentersRepo repo;

    public List<ShortExamCentersDTO> getShortExamCentersInfo(){
        return repo.getShortExamCentersInfo();
    }
}
