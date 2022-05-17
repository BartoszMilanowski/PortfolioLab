package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.services.DonationService;
import pl.coderslab.charity.services.InstitutionService;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;

    private final DonationService donationService;

    public HomeController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @RequestMapping("/")
    public String homeAction(Model model){

        int donationsSum = donationService.quantitySum();
        model.addAttribute("quantity", donationsSum);
        List<Institution> institutionList = institutionService.findAll();
        model.addAttribute("institutions", institutionList);
        return "index";
    }
}
