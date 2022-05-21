package pl.coderslab.charity.controllers;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.services.DonationService;
import pl.coderslab.charity.services.InstitutionService;
import pl.coderslab.charity.services.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;


    public HomeController(InstitutionService institutionService, DonationService donationService,
                          UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String homeAction(Model model){

        int donationsSum = donationService.quantitySum();
        int donationNumber = donationService.findAll().size();
        model.addAttribute("quantity", donationsSum);
        model.addAttribute("donationsNumber", donationNumber);
        List<Institution> institutionList = institutionService.findAll();
        model.addAttribute("institutions", institutionList);
        return "index";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "login";
    }

    @GetMapping("/zarejestruj-sie")
    public String registerForm(){
        return "register";
    }

    @PostMapping("/zarejestruj-sie")
    public String register(HttpServletRequest request){

        User user = new User();
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(passwordEncoder.encode(request.getParameter("password")));
        userService.save(user);

        return "redirect:/login";
    }
}
