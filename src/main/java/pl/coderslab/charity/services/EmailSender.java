package pl.coderslab.charity.services;

import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.User;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
@AllArgsConstructor
public class EmailSender {


    private JavaMailSender javaMailSender;


    public void newAdmin(User user, String password) {

        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(user.getEmail());
            helper.setFrom("info.egrades@gmail.com");
            helper.setSubject("Rejestracja w 'Oddam w dobre ręce'");
            helper.setText("Cześć " + user.getName() + "\nZostałeś zarejestrowany jako administrator w witrynie " +
                    "'Oddam w dobre ręce'"
                    + "\nLogin: " + user.getEmail() + "\nHasło: " + password +
                    "\nPamiętaj, aby zmienić hasło po pierwszym logowaniu!\nPozdrawiamy.");

        } catch (MessagingException e){
            e.printStackTrace();
        }
        javaMailSender.send(message);
    }

    public void newUser(User user){
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(user.getEmail());
            helper.setFrom("info.egrades@gmail.com");
            helper.setSubject("Rejestracja w 'Oddam w dobre ręce'");
            helper.setText("Cześć " + user.getName() + "\nWitamy w aplikacji 'Oddam w dobre ręce!" +
                    "\nTwój login: " + user.getEmail() +
                    "\nDziękujemy, że jesteś z nami!");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        javaMailSender.send(message);
    }
}
