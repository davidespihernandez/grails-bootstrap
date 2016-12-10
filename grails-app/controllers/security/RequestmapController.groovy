package security

import grails.bootstrap.SecurityService

class RequestmapController extends grails.plugin.springsecurity.ui.RequestmapController {
    static allowedMethods = [save: 'POST', update: ['PUT', 'POST'], delete: ['DELETE', 'POST'], create: 'GET']
    SecurityService securityService
    def delete(){
        log.info("Delete requestmap ${params.id}")
        flash.message = 'Requestmap deleted!'
        securityService.deleteRequestmap(Long.valueOf(params.id))
        render(view: "search")
    }
    def update(){
        log.info("Update requestmap ${params.id}")
        flash.message = 'Requestmap updated!'
        try{
            securityService.updateRequestmap(params)
        }
        catch(Exception e){
            flash.message = 'Error updating requestmap -> ' + e.getMessage()
        }
        render(view: "search")
    }
    def save(){
        log.info("Create requestmap ${params}")
        flash.message = 'Requestmap created!'
        try{
            securityService.createRequestmap(params)
        }
        catch(Exception e){
            flash.message = 'Error creating requestmap -> ' + e.getMessage()
        }
        render(view: "search")
    }

    def create(){
        //by default renders the view with the same name
    }
}
