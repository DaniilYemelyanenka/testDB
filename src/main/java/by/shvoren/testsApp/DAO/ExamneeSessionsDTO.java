package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ExamneeSessionsDTO {
    private Integer sessionId;
    private String centerName;
    private String sessionDate;
    private String status;

    private List<SessionSubjectDTO> subjects;
}
