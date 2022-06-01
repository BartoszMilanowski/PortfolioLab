package pl.coderslab.charity.controllers;

import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.conf.EmailSender;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.services.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Controller
@AllArgsConstructor
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    private final RoleService roleService;

    private final EmailSender emailSender;



    @GetMapping("/")
    public String homeAction(Model model){

        int donationsSum = donationService.quantitySum();
        int donationNumber = donationService.findAll().size();
        model.addAttribute("quantity", donationsSum);
        model.addAttribute("donationsNumber", donationNumber);
        List<Institution> institutionList = institutionService.findAllActive();
        model.addAttribute("institutions", institutionList);
        return "index";
    }
    @GetMapping("/zarejestruj-sie")
    public String registerForm(){
        return "register";
    }


    @GetMapping("/login/error")
    public String login(Model model){

        model.addAttribute("error", "Wprowadzono błędny adres e-mail lub hasło!");
        return "login";
    }

    @PostMapping("/zarejestruj-sie")
    public String register(HttpServletRequest request){

        User user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setEnabled(true);
        user.setPassword(passwordEncoder.encode(request.getParameter("password")));
        Set<Role> roleSet = new HashSet<>();
        roleSet.add(roleService.findByName("ROLE_USER"));
        user.setRoles(roleSet);
        emailSender.newUser(user);
        userService.save(user);

        return "redirect:/login";
    }

    @GetMapping("/zmien-haslo")
    public String changePassForm(){
        return "change-password";
    }

    @PostMapping("/zmien-haslo")
    public String changePass(HttpServletRequest request){
        User user = userService.findById(Long.parseLong(request.getParameter("userId")));
        user.setPassword(passwordEncoder.encode(request.getParameter("password")));
        userService.update(user);
        return "redirect:/login";
    }
}
