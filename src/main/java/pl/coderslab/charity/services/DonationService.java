package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class DonationService {

    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Transactional
    public void save(Donation donation){
        donationRepository.save(donation);
    }

    @Transactional
    public void update(Donation donation){
        donationRepository.save(donation);
    }

    @Transactional
    public void deleteById(Long id){
        donationRepository.deleteById(id);
    }

    public Donation findById(Long id){
        Optional<Donation> donationOpt = donationRepository.findById(id);
        return donationRepository.findByOpt(donationOpt);
    }

    public List<Donation> findAll(){
        return donationRepository.findAll();
    }

    public List<Donation> findByInstitution(Institution institution){
        return donationRepository.findByInstitution(institution);
    }

    public List<Donation> findByCity(String city){
        return donationRepository.findByCity(city);
    }

    public List<Donation> findByCategory(Category category){
        return donationRepository.findByCategory(category);
    }

    public int quantitySum(){
        int sum = 0;
        List<Donation> donations = findAll();

        for (Donation d : donations){
            int quantity = d.getQuantity();
            sum = sum + quantity;
        }

        return sum;
    }

    @Transactional
    public void addCategoryToDonation(Category category, Donation donation){
        List<Category> categories = donation.getCategories();
        categories.add(category);
        donation.setCategories(categories);
        update(donation);
    }
}
