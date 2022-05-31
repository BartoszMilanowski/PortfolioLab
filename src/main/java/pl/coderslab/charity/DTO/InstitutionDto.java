package pl.coderslab.charity.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InstitutionDto {

    private Long id;

    private String name;

    private String description;

    private String active;

    public InstitutionDto(Long id, String name,
                          String description, boolean active) {
        this.id = id;
        this.name = name;
        this.description = description;

        if (active){
            this.active = "aktywna";
        } else {
            this.active = "nieaktywna";
        }
    }
}
