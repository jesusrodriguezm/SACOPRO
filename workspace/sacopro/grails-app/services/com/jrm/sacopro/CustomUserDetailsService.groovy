package com.jrm.sacopro

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/**
 * Este servicio es para poder entrar el sistema con el nombre de usuario o con el email
 * @author jesusrodriguez
 *
 */
class CustomUserDetailsService implements GrailsUserDetailsService {
  /**
    * Some Spring Security classes (e.g. RoleHierarchyVoter) expect at least one role, so
    * we give a user with no granted roles this one which gets past that restriction but
    * doesn't grant anything.   
    */
   static final List NO_ROLES = 
           [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]

   UserDetails loadUserByUsername(String username, boolean loadRoles) 
           throws UsernameNotFoundException {
       return loadUserByUsername(username)
   }

   UserDetails loadUserByUsername(String username)
           throws UsernameNotFoundException {
   Usuario.withTransaction { status ->
       Usuario user = Usuario.findByUsernameOrEmail(username, username)
           if (!user) {
               throw new UsernameNotFoundException('User not found', 
                       username)
           }
           def authorities = user.authorities.collect { 
               new GrantedAuthorityImpl(it.authority)
           }

           return new GrailsUser(user.username,
                   user.password,
                   user.enabled,
                   !user.accountExpired,
                   !user.passwordExpired,
                   !user.accountLocked,
                   authorities ?: NO_ROLES,
                   user.id)
       }
   }
}
