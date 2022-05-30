package pl.coderslab.charity.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;

    private String lastName;

    private String email;

    private String password;

    private boolean enabled;

//    @ManyToOne
//    @JoinColumn(name = "role_id")
//    private Role role;

   @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
   @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
   inverseJoinColumns = @JoinColumn(name = "role_id"))
   private Set<Role> roles = new HashSet<>();

   public boolean hasRole(String roleName){
       Iterator<Role> iterator = this.roles.iterator();
       while ((iterator.hasNext())){
           Role role = iterator.next();
           if (role.getName().equals(roleName)){
               return true;
           }
       }
       return false;
   }


    public String getName(){
        return firstName + " " + lastName;
    }
}
