package security

import grails.bootstrap.SecurityService

class RoleController extends grails.plugin.springsecurity.ui.RoleController {
    static allowedMethods = [save: 'POST', update: ['PUT', 'POST'], delete: ['DELETE', 'POST'], create: 'GET']
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
        log.info("Update role ${params.id}")
        flash.message = 'Role created!'
        try{
            securityService.createRole(params)
        }
        catch(Exception e){
            flash.message = 'Error creating role -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def create(){
        //by default renders the view with the same name
    }

}
