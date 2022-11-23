package org.springframework.samples.petclinic.security;

import io.inuka.ikola.ObjectLevelAuthorizerBuilder;
import io.inuka.ikola.ObjectLevelSecurityConfigurer;
import io.inuka.ikola.impl.LambdaExpressionObjectOwnerResolver;
import io.inuka.ikola.impl.MappedObjectAuthorizedRolesResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.samples.petclinic.model.Pet;
import org.springframework.samples.petclinic.model.Role;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Function;

@Configuration
public class ObjectLevelSecurityConfig extends ObjectLevelSecurityConfigurer {
    private JdbcAuthenticatedUserIdResolver authenticatedUserIdResolver;
    private Roles roles;

    @Autowired
    public ObjectLevelSecurityConfig(JdbcAuthenticatedUserIdResolver authenticatedUserIdResolver, Roles roles) {
        this.authenticatedUserIdResolver = authenticatedUserIdResolver;
        this.roles = roles;
    }

    @Override
    protected void configure(ObjectLevelAuthorizerBuilder objectLevelAuthorizerBuilder) {
        Function f = (o) ->  ((Pet)o).getOwner().getId();
        Function f2 = (o) ->  ((org.springframework.samples.petclinic.rest.dto.PetDto)o).getOwnerId();
        Set<String> petRolesForView = new HashSet<>();
        petRolesForView.add(roles.ADMIN);

        Set<String> petRolesForChange = new HashSet<>();
        petRolesForChange.add(roles.ADMIN);
        Set<String> petRolesForDelete = new HashSet<>();
        petRolesForDelete.add(roles.ADMIN);

        objectLevelAuthorizerBuilder.withAuthenticatedUserIdResolver(authenticatedUserIdResolver)
            .withRoleBasedAccess(new MappedObjectAuthorizedRolesResolver()
                .setObjectAuthorizedRoles(Pet.class, petRolesForView, petRolesForChange, petRolesForDelete)
            .setObjectAuthorizedRoles(org.springframework.samples.petclinic.rest.dto.PetDto.class, petRolesForView, petRolesForChange, petRolesForDelete))
            .withObjectOwnerResolver(new LambdaExpressionObjectOwnerResolver()
                .setObjectOwnerIdResolver(Pet.class,f)
                .setObjectOwnerIdResolver(org.springframework.samples.petclinic.rest.dto.PetDto.class,f2));
    }
}
