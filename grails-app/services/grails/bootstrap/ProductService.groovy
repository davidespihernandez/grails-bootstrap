package grails.bootstrap

import grails.transaction.Transactional

@Transactional
class ProductService {

    List<Product> findAllProducts() {
        Product.findAll()
    }

    Product createProduct(parameters){
        Product product = Product.findByCode(parameters.code)
        if(product){
            return(product)
        }
        new Product(parameters).save()
    }

    Product saveProduct(Product product){
        product.save(flush: true)
    }

    def deleteProduct(Product product){
        product.delete(flush: true)
    }
}
