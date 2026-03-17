package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SubjectsScoresDTO {
    private Integer userId;
    private String firstName;
    private String LastName;
    private String subject;
    private Integer totalScore;
}
