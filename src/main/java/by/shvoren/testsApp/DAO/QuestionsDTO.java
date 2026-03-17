package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionsDTO {
    private Integer id;
    private String questionText;
    private Integer score;
    private List<AnswerDTO> answersList;
}
