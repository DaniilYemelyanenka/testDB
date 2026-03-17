package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AvgScoreDateDTO {
    private Date sessionDate;
    private Integer avgScore;
}
