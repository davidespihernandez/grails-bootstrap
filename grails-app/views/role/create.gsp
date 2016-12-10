<html>
<head>
	<meta name="layout" content="main"/>
	<title>Role creation</title>
</head>
<body>
	<h3>
		Role
		<small>Create role</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:form controller="role" method="POST" action="save">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">Authority</label>
							<g:textField name='authority' size='50' maxlength='255' autocomplete='off' class="form-control"/>
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
