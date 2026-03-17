package by.shvoren.testsApp.DAO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ShortExamneeDTO {
    private Integer examneeID;
    private String firstName;
    private String lastName;
    private boolean isActive;
    private Integer activeRegistrations;
    private Integer totalAppeals;
}
