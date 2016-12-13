<html>
<head>
	<meta name="layout" content="main"/>
	<title>User creation</title>
</head>
<body>
	<h3>
		User
		<small>Create user</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:if test="${user!=null && user.hasErrors()}">
				<div class="panel panel-danger">
					<div class="panel-heading">Validation errors</div>
					<div class="panel-body">
						<g:eachError var="err" bean="${user}">
							<p class="text-danger"><g:message error="${err}"/></p>
						</g:eachError>
					</div>
				</div>
			</g:if>
			<g:form controller="user" method="POST" action="save">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">User</label>
							<g:textField name='username' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user?.username}"/>
						</div>
						<div class="form-group">
							<label class="control-label">Password</label>
							<g:passwordField name='password' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user?.password}"/>
						</div>
						<div class="form-group">
							<label class="control-label">Email</label>
							<g:textField name='email' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user?.email}" />
						</div>
						<div class="form-group">
							<label class="control-label">Full name</label>
							<g:textField name='fullName' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user?.fullName}" />
						</div>
						<util:checkbox name="enabled" label="Enabled" checked="${user?.enabled}" />
						<util:checkbox name="accountExpired" label="Account expired" checked="${user?.accountExpired}" />
						<util:checkbox name="accountLocked" label="Account locked" checked="${user?.accountLocked}" />
						<util:checkbox name="passwordExpired" label="Password expired" checked="${user?.passwordExpired}" />
					</div>
					<div class="panel-footer">
						<g:actionSubmit action="save" value="Save" class="btn btn-primary" />
					</div>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
