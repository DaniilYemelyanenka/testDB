package by.shvoren.testsApp.service;

import by.shvoren.testsApp.DAO.ShortExamneeDTO;
import by.shvoren.testsApp.repo.ExamneeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamneeServie {

    @Autowired
    private ExamneeRepo repo;

    public List<ShortExamneeDTO> getShortExamneeInfo(){
        return repo.getShortExamneeInfo();
    }
}
