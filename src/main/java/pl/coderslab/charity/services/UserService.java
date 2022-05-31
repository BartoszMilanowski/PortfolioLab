package pl.coderslab.charity.services;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.DTO.UserDto;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public void save(User user){
        userRepository.save(user);
    }

    @Transactional
    public void update(User user){
        userRepository.save(user);
    }

    @Transactional
    public void deleteById(Long id){
        userRepository.deleteById(id);
    }

    @Transactional
    public void changeEnabled(User user){
        if (user.isEnabled()){
            user.setEnabled(false);
        } else {
            user.setEnabled(true);
        }
        userRepository.save(user);
    }

    public List<UserDto> findUsers(){
        List<User> all = userRepository.findAll();
        List<UserDto> list = new ArrayList<>();
        for (User u : all){
            if (u.hasRole("ROLE_USER")){
                UserDto userDto = new UserDto(u.getId(), u.getFirstName(), u.getLastName(),
                        u.getEmail(), u.isEnabled());
                list.add(userDto);
            }
        }
        return list;
    }

    public List<UserDto> findAdmins(){
        List<User> all = userRepository.findAll();
        List<UserDto> list = new ArrayList<>();
        for (User u : all){
            if (u.hasRole("ROLE_ADMIN")){
                UserDto userDto = new UserDto(u.getId(), u.getFirstName(), u.getLastName(),
                        u.getEmail(), u.isEnabled());
                list.add(userDto);
            }
        }
        return list;
    }

    public List<User> findAll(){
        return userRepository.findAll();
    }

    public User findById(Long id){
        Optional<User> userOpt = userRepository.findById(id);
        return userRepository.findByOpt(userOpt);
    }

    public User findByEmail(String email){
        return userRepository.findByEmail(email);
    }
}
