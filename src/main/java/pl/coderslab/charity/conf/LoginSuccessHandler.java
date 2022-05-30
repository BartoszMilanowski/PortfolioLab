package pl.coderslab.charity.conf;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.services.CurrentUser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws ServletException, IOException {

        CurrentUser currentUser = (CurrentUser) authentication.getPrincipal();
        String redirectUrl = request.getContextPath();

        if (currentUser.hasRole("ROLE_USER")){
            redirectUrl = "/";
        } else if (currentUser.hasRole("ROLE_ADMIN")){
            redirectUrl = "/admin/";
        }
        response.sendRedirect(redirectUrl);
    }
}
