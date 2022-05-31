package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.services.CategoryService;
import pl.coderslab.charity.services.DonationService;
import pl.coderslab.charity.services.InstitutionService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/przekaz-dary")
public class DonationController {

    private final DonationService donationService;

    private final CategoryService categoryService;

    private final InstitutionService institutionService;

    public DonationController(DonationService donationService, CategoryService categoryService,
                              InstitutionService institutionService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

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
    public String donationForm(Donation donation, HttpServletRequest request){

        donationService.save(donation);
        return "redirect:/przekaz-dary/przeslano";
    }

    @GetMapping("/przeslano")
    public String showFormConfirmation(){
        return "form-confirmation";
    }


}
