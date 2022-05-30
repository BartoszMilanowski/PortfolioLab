package pl.coderslab.charity.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserAtList {

    private Long id;

    private String firstName;

    private String lastName;

    private String email;

    private String enabled;

    private String role;


    public UserAtList(Long id, String firstName, String lastName, String email,
                      boolean enabledBoolean, boolean admin) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        if (enabledBoolean){
            this.enabled = "aktywny";
        } else {
            this.enabled = "nieaktywny";
        }
        if (!admin){
            role = "użytkownik";
        } else {
            role = "administrator";
        }
    }

    public String getName(){
        return firstName + " " + lastName;
    }
}
