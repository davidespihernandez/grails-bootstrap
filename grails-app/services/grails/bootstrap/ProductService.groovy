package grails.bootstrap

import grails.transaction.Transactional

@Transactional
class ProductService {

    def findAllProducts() {
        Product.findAll()
    }

    def createProduct(parameters){
        Product product = Product.findByCode(parameters.code)
        if(product){
            return(product)
        }
        new Product(parameters).save()
    }
}
