package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.DTO.InstitutionDto;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
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

    @Transactional
    public void deactivateFoundation(Institution institution){
        if(institution.isActive()){
            institution.setActive(false);
        } else {
            institution.setActive(true);
        }
        institutionRepository.save(institution);
    }

    public List<Institution> findAllActive(){
        List<Institution> active = new ArrayList<>();
        List<Institution> all = institutionRepository.findAll();
        for (Institution i : all){
            if (i.isActive()){
                active.add(i);
            }
        }
        return active;
    }

    public List<InstitutionDto> findAll(){
        List<Institution> all = institutionRepository.findAll();
        List<InstitutionDto> list = new ArrayList<>();
        for (Institution i : all){
            if (i.isActive()){
                InstitutionDto institutionDto =
                        new InstitutionDto(i.getId(), i.getName(), i.getDescription(), true);
                list.add(institutionDto);
            } else {
                InstitutionDto institutionDto =
                        new InstitutionDto(i.getId(), i.getName(), i.getDescription(), false);
                list.add(institutionDto);
            }
        }
        return list;
    }

    public Institution findById(Long id){
        Optional<Institution> institutionOpt = institutionRepository.findById(id);
        return institutionRepository.findByOpt(institutionOpt);
    }

    public Institution findByName(String name){
        return institutionRepository.findByName(name);
    }


}
