package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;

import java.util.List;
import java.util.Optional;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("select d from Donation d where d = ?1")
    Donation findByOpt(Optional<Donation> donationOpt);

    @Query("select d from Donation d where d.institution = ?1")
    List<Donation> findByInstitution(Institution institution);

    @Query("select d from Donation d where d.city = ?1")
    List<Donation> findByCity(String city);

    @Query("select d from Donation d where ?1 member of d.categories")
    List<Donation> findByCategory (Category category);
}
