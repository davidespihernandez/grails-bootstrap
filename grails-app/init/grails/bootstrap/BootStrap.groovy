package grails.bootstrap

class BootStrap {

    ProductService productService
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
        log.info('Ending bootstrap')
    }
    def destroy = {
    }
}
