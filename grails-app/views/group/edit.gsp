<html>
<head>
	<meta name="layout" content="main"/>
	<title>Edit group</title>
</head>
<body>
	<h3>
		Group detail
		<small>Edit group</small>
	</h3>
	<div class="row">
		<div class="col-lg-4">
			<g:render template="/shared/notificationTemplate" />
			<g:form controller="group" method="POST">
				<div class="panel panel-default">
					<div class="panel-heading">Group info</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">Name</label>
							<g:textField name='name' size='50' maxlength='255' autocomplete='off' class="form-control" value="${group.name}"/>
						</div>
						<g:hiddenField name="id" value="${group.id}" />
					</div>
					<div class="panel-footer">
						<g:actionSubmit action="update" value="Save" class="btn btn-primary" />
						<g:actionSubmit action="delete" value="Delete" class="btn btn-danger pull-right" id='${group.id}'/>
					</div>
				</div>
			</g:form>
		</div>
		<div class="col-lg-4">
			<div class="row">
				<div class="col-lg-12">
					<g:render template="/user/tableCheckboxTemplate" model="[userList: users, group: group, panelTitle: 'Users in group']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add user</div>
						<div class="panel-body">
							<g:form controller="group" method="POST" action="addUser">
									<g:hiddenField name="groupId" value="${group.id}" />
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
					<g:render template="/role/tableCheckboxTemplate" model="[roleList: roles, group: group, panelTitle: 'Roles in group']" />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Add role</div>
						<div class="panel-body">
							<g:form controller="group" method="POST" action="addRole">
								<g:hiddenField name="groupId" value="${group.id}" />
								<div class="form-group">
									<label class="control-label">Select role</label>
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
	</div>
</body>
</html>
