package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.DTO.UserAtList;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.services.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String adminDashboard(){
        return "admin/dashboard";
    }

    @GetMapping("/users")
    public String usersList(Model model){
        List<UserAtList> list = userService.usersAtList();
        model.addAttribute("list", list);
        return "admin/users-list";
    }

    @GetMapping("/user/enabled/{userId}")
    public String changeEnabled(@PathVariable Long userId){
        User user = userService.findById(userId);
        userService.changeEnabled(user);
        return "redirect:/admin/users";
    }
}
