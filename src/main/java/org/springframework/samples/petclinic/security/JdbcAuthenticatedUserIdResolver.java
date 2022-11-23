package org.springframework.samples.petclinic.security;

import io.inuka.ikola.AuthenticatedUserIdResolver;
import org.springframework.samples.petclinic.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

@Component
public class JdbcAuthenticatedUserIdResolver implements AuthenticatedUserIdResolver {
    private UserService userService;

    public JdbcAuthenticatedUserIdResolver(UserService userService) {
        this.userService = userService;
    }

    @Override
    public Object resolveUserId(Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if (principal != null) {
            User userDetails = (User) principal;
            return userService.getByUsername(userDetails.getUsername());
        }
        return null;
    }
}
