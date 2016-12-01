package grails.bootstrap

import grails.bootstrap.security.User
import grails.transaction.Transactional
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException

@Transactional
class SecurityService implements UserDetailsService{

    @Override
    UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return User.findByUsername(s)
    }
}
