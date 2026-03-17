package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestDTO {
    private Integer id;
    private String title;
    private String subjectName;
    private Integer durationMinutes;
    private List<QuestionsDTO> questionsList;
}
