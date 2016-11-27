package grails.bootstrap

class Product {
    String code
    String description
    static constraints = {
        code maxSize: 10, nullable: false, unique: true
        description maxSize: 255, nullable: false
    }
}
