<html>
<head>
	<meta name="layout" content="main"/>
	<title>Edit user</title>
</head>
<body>
	<h3>
		User detail
		<small>Edit user</small>
	</h3>
	<div class="row">
		<div class="col-lg-4">
			<g:render template="/shared/notificationTemplate" />
			<g:form controller="user" method="POST">
				<div class="panel panel-default">
					<div class="panel-heading">User info</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">User</label>
							<g:textField name='username' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user.username}"/>
						</div>
						<div class="form-group">
							<label class="control-label">Password</label>
							<g:passwordField name='password' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user.password}"/>
						</div>
						<div class="form-group">
							<label class="control-label">Email</label>
							<g:textField name='email' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user.email}"/>
						</div>
						<div class="form-group">
							<label class="control-label">Full name</label>
							<g:textField name='fullName' size='50' maxlength='255' autocomplete='off' class="form-control" value="${user.fullName}"/>
						</div>
						<util:checkbox name="enabled" label="Enabled" checked="${user.enabled}" />
						<util:checkbox name="accountExpired" label="Account expired" checked="${user.accountExpired}" />
						<util:checkbox name="accountLocked" label="Account locked" checked="${user.accountLocked}" />
						<util:checkbox name="passwordExpired" label="Password expired" checked="${user.passwordExpired}" />
						<g:hiddenField name="id" value="${user.id}" />
					</div>
					<div class="panel-footer">
						<g:actionSubmit action="update" value="Save" class="btn btn-primary" />
						<g:actionSubmit action="delete" value="Delete" class="btn btn-danger pull-right" id='${user.id}'/>
					</div>
				</div>
			</g:form>
		</div>
		<div class="col-lg-4">
			<div class="row">
				<div class="col-lg-12">
					<g:render template="/role/tableCheckboxTemplate" model="[roleList: roles, user: user, panelTitle: 'Roles assigned']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add role</div>
						<div class="panel-body">
							<g:form controller="user" method="POST" action="addRole">
								<g:hiddenField name="userId" value="${user.id}" />
								<div class="form-group">
									<label class="control-label">Select group</label>
									<g:select name='roleCombobox' from='${rolesAvailable}' optionKey="id" optionValue="authority" noSelection="['null': '']" class="form-control"/>
								</div>
								<div class="form-group">
									<g:submitButton name="addRole" value="Add selected" class="btn btn-primary" />
								</div>
								</span>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="row">
				<div class="col-lg-12">
					<g:render template="/group/tableCheckboxTemplate" model="[groupList: groups, user: user, panelTitle: 'Groups assigned']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add group</div>
						<div class="panel-body">
							<g:form controller="user" method="POST" action="addGroup">
								<g:hiddenField name="userId" value="${user.id}" />
								<div class="form-group">
									<label class="control-label">Select group</label>
									<g:select name='groupCombobox' from='${groupsAvailable}' optionKey="id" optionValue="name" noSelection="['null': '']" class="form-control"/>
								</div>
								<div class="form-group">
									<g:submitButton name="addGroup" value="Add selected" class="btn btn-primary" />
								</div>
								</span>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
