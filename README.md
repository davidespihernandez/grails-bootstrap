# grails-bootstrap
## Grails 3 + gsp + bootstrap + spring security

I use a CSS based on the Wrapbootstrap Angle template. You can find this template on https://wrapbootstrap.com/theme/angle-bootstrap-admin-template-WB04HF123

Buy a license of this boostrap template if you want to use it on your app.

You need a MySQL database running on localhost, and a user/pass grails/grails. You can change the user, password and database settings in the application.yml file.

The Bootstrap init script creates two roles: USER and ADMIN, and two users, user/user and admin/admin

The /product path is secured, so you have to login using one of these users in order to operate products.



