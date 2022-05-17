package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.repository.CategoryRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Transactional
    public void save(Category category){
        categoryRepository.save(category);
    }

    @Transactional
    public void update(Category category){
        categoryRepository.save(category);
    }

    @Transactional
    public void deleteById(Long id){
        categoryRepository.deleteById(id);
    }

    public Category findById(Long id){
        Optional<Category> categoryOpt = categoryRepository.findById(id);
        return categoryRepository.findByOpt(categoryOpt);
    }

    public List<Category> findAll(){
        return categoryRepository.findAll();
    }

    public Category findByName(String name){
        return categoryRepository.findByName(name);
    }
}
