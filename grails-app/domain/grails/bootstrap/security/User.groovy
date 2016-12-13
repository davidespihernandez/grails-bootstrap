package grails.bootstrap.security

import grails.plugin.springsecurity.userdetails.GrailsUser
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable  {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String email
	String fullName

	Set<Group> getAuthorities() {
		UserGroup.findAllByUser(this)*.group
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		fullName blank: true, nullable: true, maxSize: 255
		email blank: false, nullable: false, maxSize: 255, email: true
	}

	static mapping = {
		password column: '`password`'
	}
}
