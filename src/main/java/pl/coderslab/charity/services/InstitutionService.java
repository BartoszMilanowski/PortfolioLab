package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Transactional
    public void save(Institution institution){
        institutionRepository.save(institution);
    }

    @Transactional
    public void update(Institution institution){
        institutionRepository.save(institution);
    }

    @Transactional
    public void deleteById(Long id){
        institutionRepository.deleteById(id);
    }

    public Institution findById(Long id){
        Optional<Institution> institutionOpt = institutionRepository.findById(id);
        return institutionRepository.findByOpt(institutionOpt);
    }

    public Institution findByName(String name){
        return institutionRepository.findByName(name);
    }
}
