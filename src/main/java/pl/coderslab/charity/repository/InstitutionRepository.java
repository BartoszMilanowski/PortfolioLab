package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.Institution;

import java.util.Optional;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution, Long> {

    @Query("select i from Institution i where i = ?1")
    Institution findByOpt(Optional<Institution> institutionOpt);

    Institution findByName(String name);

}
