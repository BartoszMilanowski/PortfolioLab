package pl.coderslab.charity.DTO;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class DonationDto {

    private Long id;

    private int quantity;

    private String categories;

    private String foundation;

    private String status;

    private String registered;

    private String pickedUp;

    public DonationDto(Donation donation){
        this.id = donation.getId();
        this.quantity = donation.getQuantity();
        if (donation.isStatus()){
            this.status = "odebrane";
        } else {
            this.status = "nieodebrane";
        }
        List<Category> categoryList = donation.getCategories();
        List<String> cNames = new ArrayList<>();
        for (Category c : categoryList){
            cNames.add(c.getName());
        }
        this.categories = String.join(", ", cNames);
        this.foundation = donation.getInstitution().getName();
        this.registered = String.valueOf(donation.getRegistered());
        if (donation.getPickedUp() != null){
            this.pickedUp = String.valueOf(donation.getPickedUp());
        } else {
            this.pickedUp = "-";
        }
    }
}
