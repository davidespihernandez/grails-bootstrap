<html>
<head>
	<meta name="layout" content="main"/>
	<title>Group creation</title>
</head>
<body>
	<h3>
		Group
		<small>Create group</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:form controller="group" method="POST" action="save">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">Name</label>
							<g:textField name='name' size='50' maxlength='255' autocomplete='off' class="form-control"/>
						</div>
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
