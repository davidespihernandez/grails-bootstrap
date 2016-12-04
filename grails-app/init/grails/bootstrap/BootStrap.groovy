package grails.bootstrap

import grails.bootstrap.security.Requestmap
import grails.bootstrap.security.Role
import grails.bootstrap.security.User

class BootStrap {

    ProductService productService
    SecurityService securityService
    def init = { servletContext ->
        println "starting..."
        log.info('Starting bootstrap')
        def testProducts = [
                [code: 'AAA', description: 'Product AAA'],
                [code: 'BBB', description: 'Product BBB']
        ]
        testProducts.each {
            productService.createProduct(it)
        }
        //roles and users
        Role adminRole = securityService.createRole('ROLE_ADMIN')
        Role userRole = securityService.createRole('ROLE_USER')
        User adminUser = securityService.createUser(username: 'admin',
                password: 'admin',
                enabled: true,
                accountExpired: false,
                accountLocked: false,
                passwordExpired: false,
                email: 'david.espi@atkloud.com',
                fullName: 'Admin user'
        )
        User regularUser = securityService.createUser(username: 'user',
                password: 'user',
                enabled: true,
                accountExpired: false,
                accountLocked: false,
                passwordExpired: false,
                email: 'david.espi@atkloud.com',
                fullName: 'Regular user'
        )
        securityService.grantRole(adminUser, adminRole)
        securityService.grantRole(adminUser, userRole)
        securityService.grantRole(regularUser, userRole)

        //save all public url
        for (String url in [
                '/', '/error', '/index', '/index.gsp', '/**/favicon.ico', '/shutdown',
                '/**/js/**', '/**/css/**', '/**/images/**',
                '/login', '/login.*', '/login/*',
                '/logout', '/logout.*', '/logout/*']) {
            securityService.createRequestmap(url: url, configAttribute: 'permitAll')
        }
        securityService.createRequestmap(url: '/product/**', configAttribute: "isAuthenticated()")

        log.info('Ending bootstrap')
    }
    def destroy = {
    }
}
