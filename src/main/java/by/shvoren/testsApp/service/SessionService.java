package by.shvoren.testsApp.service;

import by.shvoren.testsApp.DAO.ExamneeSessionsDTO;
import by.shvoren.testsApp.repo.SesssionRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SessionService {
    @Autowired
    private SesssionRepo repo;

    public List<ExamneeSessionsDTO> getExamneeSessionsDTO(String email) {
        return repo.getExamneeSessions(1);
    }
}
