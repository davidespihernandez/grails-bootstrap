package grails.bootstrap

import grails.bootstrap.security.Requestmap
import grails.bootstrap.security.Role
import grails.bootstrap.security.User
import grails.bootstrap.security.UserRole
import grails.transaction.Transactional

@Transactional
class SecurityService{
    User findUserByUsername(String username){
        User.findByUsername(username)
    }

    Role findRoleByAuthority(String authority){
        Role.findByAuthority(authority)
    }

    Role createRole(String authority){
        Role existing = findRoleByAuthority(authority)
        if(existing){
            return(existing)
        }
        new Role(authority: authority).save(flush: true)
    }

    User createUser(parameters){
        User existing = User.findByUsername(parameters.username)
        if(existing){
            return(existing)
        }
        new User(parameters).save(flush: true)
    }

    UserRole grantRole(User user, Role role){
        UserRole existing = UserRole.findByUserAndRole(user, role)
        if(existing){
            return(existing)
        }
        new UserRole(user: user, role: role).save(flush: true)
    }

    UserRole revokeRole(User user, Role role){
        UserRole existing = UserRole.findByUserAndRole(user, role)
        if(existing){
            existing.delete(flush: true)
        }
    }

    Requestmap createRequestmap(parameters){
        Requestmap existing = Requestmap.findByUrl(parameters.url)
        if(existing){
            return(existing)
        }
        new Requestmap(url: parameters.url, configAttribute: parameters.configAttribute).save(flush: true)
    }

}
