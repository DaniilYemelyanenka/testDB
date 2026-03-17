package by.shvoren.testsApp.service;

import by.shvoren.testsApp.DAO.SubjectsScoresDTO;
import by.shvoren.testsApp.repo.SubjectsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectService {

    @Autowired
    private SubjectsRepo repo;

    public List<SubjectsScoresDTO> getSubjectScores(){
        return repo.getSubjectsScores();
    }
}
