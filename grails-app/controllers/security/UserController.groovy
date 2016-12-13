package security

import grails.bootstrap.SecurityService
import grails.bootstrap.security.Group
import grails.bootstrap.security.Role
import grails.bootstrap.security.User

class UserController extends grails.plugin.springsecurity.ui.UserController {
    static allowedMethods = [save: 'POST',
                             update: ['PUT', 'POST'],
                             delete: ['DELETE', 'POST'],
                             create: 'GET',
                             addUser: 'POST',
                             removeUsers: 'DELETE']
    SecurityService securityService
    def delete(){
        log.info("Delete user ${params.id}")
        flash.message = 'User deleted!'
        try {
            securityService.deleteUser(Long.valueOf(params.id))
        }
        catch(Exception e){
            flash.message = 'Error deleting user -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def update(){
        log.info("Update user ${params.id}")
        flash.message = 'User updated!'
        try{
            securityService.updateUser(params)
        }
        catch(Exception e){
            flash.message = 'Error updating user -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def save(){
        log.info("Create user ${params.id}")
        flash.message = 'User created!'
        User user
        try{
            user = new User(params)
            if(!user.validate()){
                flash.message = 'Error creating user! '
                render(view: "create", model: [user: user])
            }
            else{
                securityService.createUser(params)
                render(view: "search")
            }
        }
        catch(Exception e){
            flash.message = 'Exception creating user! ' + e.getMessage()
            render(view: "create", model: [user: user])
        }
    }

    def edit(){
        Long userId = Long.valueOf(params.id)
        User user = securityService.findUserById(userId)
        List<Group> userGroups = securityService.findAllGroupByUser(user)
        List<Group> userRoles = securityService.findAllRoleByUser(user)
        List<User> rolesAvailable = securityService.findAllRoleNotInUser(user)
        List<Group> groupsAvailable = securityService.findAllGroupNotInUser(user)
        if(params.user){
            user = params.user
        }
        render(view:"edit", model: [user: user, groups: userGroups, roles: userRoles, rolesAvailable: rolesAvailable, groupsAvailable: groupsAvailable])
    }

    def create(){
        //by default renders the view with the same name
    }

    def removeGroups(){
        Integer deleted = 0
        User user = securityService.findUserById(Long.valueOf(params.userId))
        params.selectedGroups?.each{
            Long groupId = Long.valueOf(it)
            Group group = securityService.findGroupById(groupId)
            securityService.revokeGroup(user, group)
            deleted++
        }
        flash.message = "$deleted Groups removed!"
        redirect(action: "edit", id: params.userId)
    }

    def addGroup(){
        Long userId, groupId
        try{
            userId = Long.valueOf(params.userId)
            groupId = Long.valueOf(params.groupCombobox)
        }
        catch(Exception e){
            userId = null
            groupId = null
        }
        User user = securityService.findUserById(userId)
        Group group = securityService.findGroupById(groupId)
        flash.message = "Error granting group"
        if(user && group){
            securityService.grantGroup(user, group)
            flash.message = "Group added!"
        }
        redirect(action: "edit", id: params.userId)
    }

    def removeRoles(){
        Integer deleted = 0
        User user = securityService.findUserById(Long.valueOf(params.userId))
        params.selectedRoles?.each{
            Long roleId = Long.valueOf(it)
            Role role = securityService.findRoleById(roleId)
            securityService.revokeRole(user, role)
            deleted++
        }
        flash.message = "$deleted Roles removed!"
        redirect(action: "edit", id: params.userId)
    }

    def addRole(){
        Long roleId, userId
        try{
            roleId = Long.valueOf(params.roleCombobox)
            userId = Long.valueOf(params.userId)
        }
        catch(Exception e){
            roleId = null
            userId = null
        }
        Role role = securityService.findRoleById(roleId)
        User user = securityService.findUserById(userId)
        flash.message = "Error granting role"
        if(role && user){
            securityService.grantRole(user, role)
            flash.message = "Role added!"
        }
        redirect(action: "edit", id: params.userId)
    }

}
