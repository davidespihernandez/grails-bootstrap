package security

import grails.bootstrap.SecurityService
import grails.bootstrap.security.GroupRole
import grails.bootstrap.security.Role
import grails.bootstrap.security.User

class RoleController extends grails.plugin.springsecurity.ui.RoleController {
    static allowedMethods = [save: 'POST',
                             update: ['PUT', 'POST'],
                             delete: ['DELETE', 'POST'],
                             create: 'GET',
                             addUser: 'POST',
                             removeUsers: 'DELETE']
    SecurityService securityService
    def delete(){
        log.info("Delete role ${params.id}")
        flash.message = 'Role deleted!'
        try {
            securityService.deleteRole(Long.valueOf(params.id))
        }
        catch(Exception e){
            flash.message = 'Error deleting role -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def update(){
        log.info("Update role ${params.id}")
        flash.message = 'Role updated!'
        try{
            securityService.updateRole(params)
        }
        catch(Exception e){
            flash.message = 'Error updating role -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def save(){
        log.info("Create role ${params.id}")
        flash.message = 'Role created!'
        try{
            securityService.createRole(params)
        }
        catch(Exception e){
            flash.message = 'Error creating role -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def edit(){
        Long roleId = Long.valueOf(params.id)
        Role role = securityService.findRoleById(roleId)
        List<Role> roleGroups = securityService.findAllGroupByRole(role)
        List<User> roleUsers = securityService.findAllUserByRole(role)
        List<User> usersAvailable = securityService.findAllUserNotInRole(role)
        render(view:"edit", model: [role: role, groups: roleGroups, users: roleUsers, usersAvailable: usersAvailable])
    }

    def create(){
        //by default renders the view with the same name
    }

    def addUser(){
        Long userId, roleId
        try{
            userId = Long.valueOf(params.userCombobox)
            roleId = Long.valueOf(params.roleId)
        }
        catch(Exception e){
            println "exception converting " + e.message
            userId = null
            roleId = null
        }
        User user = securityService.findUserById(userId)
        Role role = securityService.findRoleById(roleId)
        println "grant for $user and $role"
        flash.message = "Error granting role"
        if(user && role){
            securityService.grantRole(user, role)
            flash.message = "Role granted!"
        }
        redirect(action: "edit", id: params.roleId)
    }

    def removeUsers(){
        Integer deleted = 0
        Role role = securityService.findRoleById(Long.valueOf(params.roleId))
        params.selectedUsers?.each{
            Long userId = Long.valueOf(it)
            User user = securityService.findUserById(userId)
            securityService.revokeRole(user, role)
            deleted++
        }
        flash.message = "$deleted Users removed!"
        redirect(action: "edit", id: params.roleId)
    }

}
