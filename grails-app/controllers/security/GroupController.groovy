package security

import grails.bootstrap.SecurityService
import grails.bootstrap.security.Group
import grails.bootstrap.security.Role
import grails.bootstrap.security.User

class GroupController {
    static allowedMethods = [save: 'POST',
                             update: ['PUT', 'POST'],
                             delete: ['DELETE', 'POST'],
                             create: 'GET',
                             addUser: 'POST',
                             removeUsers: 'DELETE',
                             search: 'GET']
    SecurityService securityService
    def delete(){
        log.info("Delete group ${params.id}")
        flash.message = 'Group deleted!'
        try {
            securityService.deleteGroup(Long.valueOf(params.id))
        }
        catch(Exception e){
            flash.message = 'Error deleting group -> ' + e.getMessage()
        }
        redirect(action: "search")
    }

    def update(){
        log.info("Update group ${params.id}")
        flash.message = 'Group updated!'
        try{
            securityService.updateGroup(params)
        }
        catch(Exception e){
            flash.message = 'Error updating group -> ' + e.getMessage()
        }
        redirect(action: "search")
    }

    def save(){
        log.info("Create group ${params.id}")
        flash.message = 'Group created!'
        try{
            securityService.createGroup(params)
        }
        catch(Exception e){
            flash.message = 'Error creating group -> ' + e.getMessage()
        }
        redirect(action: "search")
    }

    def edit(){
        Long groupId = Long.valueOf(params.id)
        Group group = securityService.findGroupById(groupId)
        List<Role> groupRoles = securityService.findAllRoleByGroup(group)
        List<User> groupUsers = securityService.findAllUserByGroup(group)
        List<User> usersAvailable = securityService.findAllUserNotInGroup(group)
        List<Role> rolesAvailable = securityService.findAllRoleNotInGroup(group)
        render(view:"edit", model: [group: group, roles: groupRoles, users: groupUsers, usersAvailable: usersAvailable, rolesAvailable: rolesAvailable])
    }

    def create(){
        //by default renders the view with the same name
    }

    def addUser(){
        Long userId, groupId
        try{
            userId = Long.valueOf(params.userCombobox)
            groupId = Long.valueOf(params.groupId)
        }
        catch(Exception e){
            println "exception converting " + e.message
            userId = null
            groupId = null
        }
        User user = securityService.findUserById(userId)
        Group group = securityService.findGroupById(groupId)
        flash.message = "Error granting group"
        if(user && group){
            securityService.grantGroup(user, group)
            flash.message = "Group granted!"
        }
        redirect(action: "edit", id: params.groupId)
    }

    def removeUsers(){
        Integer deleted = 0
        Group group = securityService.findGroupById(Long.valueOf(params.groupId))
        params.selectedUsers?.each{
            Long userId = Long.valueOf(it)
            User user = securityService.findUserById(userId)
            securityService.revokeGroup(user, group)
            deleted++
        }
        flash.message = "$deleted Users removed!"
        redirect(action: "edit", id: params.groupId)
    }

    def search(){
        render(view: "search", model: [groupList: securityService.findAllGroups()])
    }

    def removeRoles(){
        Integer deleted = 0
        Group group = securityService.findGroupById(Long.valueOf(params.groupId))
        params.selectedRoles?.each{
            Long roleId = Long.valueOf(it)
            Role role = securityService.findRoleById(roleId)
            securityService.deleteGroupRole(group, role)
            deleted++
        }
        flash.message = "$deleted Roles removed!"
        redirect(action: "edit", id: params.groupId)
    }

    def addRole(){
        Long roleId, groupId
        try{
            roleId = Long.valueOf(params.roleCombobox)
            groupId = Long.valueOf(params.groupId)
        }
        catch(Exception e){
            println "exception converting " + e.message
            roleId = null
            groupId = null
        }
        Role role = securityService.findRoleById(roleId)
        Group group = securityService.findGroupById(groupId)
        flash.message = "Error granting group"
        if(role && group){
            securityService.addGroupRole(group, role)
            flash.message = "Role added!"
        }
        redirect(action: "edit", id: params.groupId)
    }


}
