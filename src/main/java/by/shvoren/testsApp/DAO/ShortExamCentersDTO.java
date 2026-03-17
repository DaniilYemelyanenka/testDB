package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ShortExamCentersDTO {
    private Integer centerID;
    private String name;
    private String city;
    private Integer capacity;
    private Integer totalExaminees;
    private Integer upcomingSessions;
    private Integer activeRegistrations;
    private Boolean active;
}
