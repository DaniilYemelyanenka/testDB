package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ExamneeTestsDTO {
    private Integer testId;
    private String testName;
    private String subject;
    private String status;
    private Integer score;
}
