package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CheckAnswerDTO {
    private Integer questionId;
    private Integer selectedOptionId;
}
