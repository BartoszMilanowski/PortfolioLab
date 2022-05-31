package pl.coderslab.charity.controllers;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.DTO.InstitutionDto;
import pl.coderslab.charity.DTO.UserDto;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.services.InstitutionService;
import pl.coderslab.charity.services.RoleService;
import pl.coderslab.charity.services.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

    private final UserService userService;

    private final RoleService roleService;

    private final InstitutionService institutionService;


    @GetMapping("/")
    public String adminDashboard(){
        return "admin/dashboard";
    }

    @GetMapping("/users")
    public String usersList(Model model){
        List<UserDto> list = userService.usersAtList();
        model.addAttribute("list", list);
        return "admin/users-list";
    }

    @GetMapping("/user/enabled/{userId}")
    public String changeEnabled(@PathVariable Long userId){
        User user = userService.findById(userId);
        userService.changeEnabled(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/delete/{userId}")
    public String deleteUser(@PathVariable Long userId){
        userService.deleteById(userId);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/edit/{userId}")
    public String editUserForm(Model model, @PathVariable Long userId){
        User user = userService.findById(userId);
        model.addAttribute("user", user);
        if(user.hasRole("ROLE_ADMIN")){
            model.addAttribute("admin", "admin");
        }
        return "admin/edit-user";
    }

    @PostMapping("/user/edit")
    public String editUser(User user, HttpServletRequest request){

        String admin = request.getParameter("admin");
        Set<Role> roleSet = new HashSet<>();
        if (admin != null){
            roleSet.add(roleService.findByName("ROLE_ADMIN"));
        } else {
            roleSet.add(roleService.findByName("ROLE_USER"));
        }
        user.setRoles(roleSet);
        user.setEnabled(true);
        userService.update(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/foundations")
    public String foundationsList(Model model){
        List<InstitutionDto> institutions = institutionService.findAll();
        model.addAttribute("list", institutions);
        return "admin/foundations-list";
    }

    @GetMapping("/foundation/add")
    public String addFoundationForm(Model model){
        Institution institution = new Institution();
        model.addAttribute("institution", institution);
        return "admin/add-foundation-form";
    }

    @PostMapping("/foundation/add")
    public String addFoundation(Institution institution){
        institution.setActive(true);
        institutionService.save(institution);
        return "redirect:/admin/foundations";
    }

    @GetMapping("/foundation/edit/{foundId}")
    public String editFoundationForm(Model model, @PathVariable Long foundId){
        Institution institution = institutionService.findById(foundId);
        model.addAttribute("institution", institution);
        return "admin/edit-foundation-form";
    }

    @PostMapping("/foundation/edit/{foundId}")
    public String editFoundation(Institution institution, @PathVariable Long foundId){
        institution.setId(foundId);
        institution.setActive(true);
        institutionService.update(institution);
        return "redirect:/admin/foundations";
    }

    @GetMapping("/foundation/deactivate/{foundId}")
    public String deactivateFoundation(@PathVariable Long foundId){
        institutionService.deactivateFoundation(institutionService.findById(foundId));
        return "redirect:/admin/foundations";
    }
}
