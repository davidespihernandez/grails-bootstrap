<html>
<head>
	<meta name="layout" content="main"/>
	<title>Edit role</title>
</head>
<body>
	<h3>
		Role detail
		<small>Edit role</small>
	</h3>
	<div class="row">
		<div class="col-lg-4">
			<g:render template="/shared/notificationTemplate" />
			<g:form controller="role" method="POST">
				<div class="panel panel-default">
					<div class="panel-heading">Role info</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">Authority</label>
							<g:textField name='authority' size='50' maxlength='255' autocomplete='off' class="form-control" value="${role.authority}"/>
						</div>
						<g:hiddenField name="id" value="${role.id}" />
					</div>
					<div class="panel-footer">
						<g:actionSubmit action="update" value="Save" class="btn btn-primary" />
						<g:actionSubmit action="delete" value="Delete" class="btn btn-danger pull-right" id='${role.id}'/>
					</div>
				</div>
			</g:form>
		</div>
		<div class="col-lg-4">
			<div class="row">
				<div class="col-lg-12">
					<g:render template="/user/tableCheckboxTemplate" model="[userList: users, role: role, panelTitle: 'Users in role']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add user</div>
						<div class="panel-body">
							<g:form controller="role" method="POST" action="addUser">
									<g:hiddenField name="roleId" value="${role.id}" />
									<div class="form-group">
										<label class="control-label">Select user</label>
										<g:select name='userCombobox' from='${usersAvailable}' optionKey="id" optionValue="fullName" noSelection="['null': '']" class="form-control"/>
									</div>
									<div class="form-group">
										<g:submitButton name="addUser" value="Add selected" class="btn btn-primary" />
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
					<g:render template="/group/tableCheckboxTemplate" model="[groupList: groups, role: role, panelTitle: 'Groups']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add group</div>
						<div class="panel-body">
							<g:form controller="role" method="POST" action="addGroup">
								<g:hiddenField name="roleId" value="${role.id}" />
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
