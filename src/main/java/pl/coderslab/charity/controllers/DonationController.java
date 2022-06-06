package pl.coderslab.charity.controllers;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.DTO.DonationDto;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.services.CategoryService;
import pl.coderslab.charity.services.DonationService;
import pl.coderslab.charity.services.InstitutionService;
import pl.coderslab.charity.services.UserService;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/przekaz-dary")
public class DonationController {

    private final DonationService donationService;

    private final CategoryService categoryService;

    private final InstitutionService institutionService;

    private final UserService userService;


    @ModelAttribute("categories")
    public List<Category> showCategories(){
        return categoryService.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> showInstitutions(){
        return institutionService.findAllActive();
    }

    @GetMapping
    public String showDonationForm(Model model){
        Donation donation = new Donation();
        model.addAttribute("donation", donation);
        return "form";
    }

    @PostMapping
    public String donationForm(Donation donation){

        donation.setRegistered(LocalDate.now());
        donation.setStatus(false);
        donationService.save(donation);
        return "redirect:/przekaz-dary/przeslano";
    }

    @GetMapping("/przeslano")
    public String showFormConfirmation(){
        return "form-confirmation";
    }

    @GetMapping("/moje-dary")
    public String myDonations(Model model, Principal principal){
        User donator = userService.findByEmail(principal.getName());
        List<DonationDto> pickedUpDonations = donationService.pickedUpByDonator(donator);
        List<DonationDto> nonPickedUpDonations = donationService.nonPickedUpByDonator(donator);
        model.addAttribute("pickedUp", pickedUpDonations);
        model.addAttribute("nonPickedUp", nonPickedUpDonations);
        return "my-donations";
    }


}
