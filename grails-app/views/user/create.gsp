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
			<g:form controller="user" method="POST" action="save">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">User</label>
							<g:textField name='username' size='50' maxlength='255' autocomplete='off' class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">Password</label>
							<g:passwordField name='password' size='50' maxlength='255' autocomplete='off' class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">Email</label>
							<g:textField name='email' size='50' maxlength='255' autocomplete='off' class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">Full name</label>
							<g:textField name='fullName' size='50' maxlength='255' autocomplete='off' class="form-control" />
						</div>
						<util:checkbox name="enabled" label="Enabled"  />
						<util:checkbox name="accountExpired" label="Account expired"  />
						<util:checkbox name="accountLocked" label="Account locked"  />
						<util:checkbox name="passwordExpired" label="Password expired"  />
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
