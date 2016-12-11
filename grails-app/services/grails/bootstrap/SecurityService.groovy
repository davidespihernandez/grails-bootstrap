package grails.bootstrap

import grails.bootstrap.security.Group
import grails.bootstrap.security.GroupRole
import grails.bootstrap.security.Requestmap
import grails.bootstrap.security.Role
import grails.bootstrap.security.User
import grails.bootstrap.security.UserGroup
import grails.bootstrap.security.UserRole
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.springframework.http.HttpMethod

@Transactional
class SecurityService{
    SpringSecurityService springSecurityService
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

    def deleteRequestmap(Long requestmapId){
        Requestmap rm = Requestmap.get(requestmapId)
        if(rm){
            rm.delete(flush: true)
            springSecurityService.clearCachedRequestmaps()
        }
    }

    def updateRequestmap(parameters){
        Requestmap rm = Requestmap.get(parameters.id)
        if(rm){
            rm.setUrl(parameters.url)
            rm.setConfigAttribute(parameters.configAttribute)
            if(parameters.httpMethod==null || parameters.httpMethod=="null"){
                rm.setHttpMethod(null)
            }
            else{
                rm.setHttpMethod(HttpMethod.valueOf(parameters.httpMethod))
            }
            rm.save(flush: true)
            springSecurityService.clearCachedRequestmaps()
        }
    }

    Role createRole(parameters){
        Role existing = Role.findByAuthority(parameters.authority)
        if(existing){
            return(existing)
        }
        new Role(authority: parameters.authority).save(flush: true)
    }

    def deleteRole(Long roleId){
        Role role = Role.get(roleId)
        if(role){
            GroupRole.deleteAll(GroupRole.findAllByRole(role))
            UserRole.deleteAll(UserRole.findAllByRole(role))
            role.delete(flush: true)
        }
    }

    def updateRole(parameters){
        Role role = Role.get(parameters.id)
        if(role){
            role.setAuthority(parameters.authority)
            role.save(flush: true)
        }
    }

    List<Group> findAllGroupByRole(Role role){
        GroupRole.findAllByRole(role).group.sort{ a,b -> a.name <=> b.name }
    }

    List<Role> findAllRoleByGroup(Group group){
        GroupRole.findAllByGroup(group).role.sort{ a,b -> a.authority <=> b.authority }
    }

    List<User> findAllUserByRole(Role role){
        UserRole.findAllByRole(role).user.sort{ a,b -> a.fullName <=> b.fullName }
    }

    List<User> findAllUserByGroup(Group group){
        UserGroup.findAllByGroup(group).user.sort{ a,b -> a.fullName <=> b.fullName }
    }

    Role findRoleById(Long id){
        Role.get(id)
    }

    List<User> findAllUserNotInRole(Role role){
        List<User> allUser = User.findAll().sort{ a,b -> a.fullName <=> b.fullName }
        List<User> inRole = findAllUserByRole(role)
        return(allUser - inRole)
    }

    List<User> findAllUserNotInGroup(Group group){
        List<User> allUser = User.findAll().sort{ a,b -> a.fullName <=> b.fullName }
        List<User> inGroup = findAllUserByGroup(group)
        return(allUser - inGroup)
    }

    User findUserById(Long id){
        User.get(id)
    }

    Group createGroup(parameters){
        Group existing = Group.findByName(parameters.name)
        if(existing){
            return(existing)
        }
        new Group(name: parameters.name).save(flush: true)
    }

    def deleteGroup(Long groupId){
        Group group = Group.get(groupId)
        if(group){
            GroupRole.deleteAll(GroupRole.findAllByGroup(group))
            UserGroup.deleteAll(UserGroup.findAllByGroup(group))
            group.delete(flush: true)
        }
    }

    def updateGroup(parameters){
        Group group = Group.get(parameters.id)
        if(group){
            group.setName(parameters.name)
            group.save(flush: true)
        }
    }

    Group findGroupById(Long id){
        Group.get(id)
    }

    List<Group> findAllGroups(){
        Group.findAll().sort{a,b -> a.name<=>b.name}
    }

    UserGroup grantGroup(User user, Group group){
        UserGroup existing = UserGroup.findByUserAndGroup(user, group)
        if(existing){
            return(existing)
        }
        new UserGroup(user: user, group: group).save(flush: true)
    }

    UserGroup revokeGroup(User user, Group group){
        UserGroup existing = UserGroup.findByUserAndGroup(user, group)
        if(existing){
            existing.delete(flush: true)
        }
    }

    def deleteGroupRole(Group group, Role role){
        GroupRole groupRole = GroupRole.findByGroupAndRole(group, role)
        if(groupRole){
            groupRole.delete(flush: true)
        }
    }

    def addGroupRole(Group group, Role role){
        GroupRole groupRole = GroupRole.findByGroupAndRole(group, role)
        if(!groupRole){
            groupRole = new GroupRole(group: group, role: role).save(flush: true)
        }
        return(groupRole)
    }

    List<Role> findAllRoleNotInGroup(Group group){
        List<Role> allRole= Role.findAll().sort{ a,b -> a.authority <=> b.authority }
        List<Role> inGroup = findAllRoleByGroup(group)
        return(allRole - inGroup)
    }

    List<Role> findAllGroupNotInRole(Role role){
        List<Group> allGroup = Group.findAll().sort{ a,b -> a.name <=> b.name }
        List<Group> inRole = findAllGroupByRole(role)
        return(allGroup - inRole)
    }

}
