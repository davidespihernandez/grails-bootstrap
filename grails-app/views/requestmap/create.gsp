<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='default.create.label' entityNameMessageCode='requestmap.label' entityNameDefault='Requestmap'/>
</head>
<body>
	<h3>
		Request map
		<small>Create requestmap</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:form controller="requestmap" method="POST" action="save">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label"><g:message code='requestmap.url.label' default='URL'/></label>
							<g:textField name='url' size='50' maxlength='255' autocomplete='off' class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label"><g:message code='requestmap.configAttribute.label' default='Config Attribute'/></label>
							<g:textField name='configAttribute' size='50' maxlength='255' autocomplete='off' class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label"><g:message code='requestmap.httpMethod.label' default='HTTP Method'/></label>
							<g:select name='httpMethod' from='${org.springframework.http.HttpMethod.values()}' noSelection="['null': 'All']" class="form-control m-b"/>
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
