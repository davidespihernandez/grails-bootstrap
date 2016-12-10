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
		<div class="col-sm-12">
			<g:form controller="role" method="POST">
				<div class="panel panel-default">
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
	</div>
</body>
</html>
