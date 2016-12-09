<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='default.edit.label' entityNameMessageCode='requestmap.label' entityNameDefault='Requestmap'/>
</head>
<body>
	<h3>
		Request map detail
		<small>Edit requestmap</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:form controller="requestmap" method="POST">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label"><g:message code='requestmap.url.label' default='URL'/></label>
							<g:textField name='url' size='50' maxlength='255' autocomplete='off' value='${requestmap.url}' class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label"><g:message code='requestmap.configAttribute.label' default='Config Attribute'/></label>
							<g:textField name='configAttribute' size='50' maxlength='255' autocomplete='off' value='${requestmap.configAttribute}' class="form-control"/>
						</div>
						<g:if test='${hasHttpMethod}'>
							<div class="form-group">
								<label class="control-label"><g:message code='requestmap.httpMethod.label' default='HTTP Method'/></label>
								<g:select name='httpMethod' from='${org.springframework.http.HttpMethod.values()}' value='${requestmap.httpMethod}' noSelection="['null': 'All']" class="form-control m-b"/>
							</div>
						</g:if>
						<g:hiddenField name="id" value="${requestmap.id}" />
					</div>
					<div class="panel-footer">
						<g:actionSubmit action="update" value="Save" class="btn btn-primary" />
						<g:actionSubmit action="delete" value="Delete" class="btn btn-danger" id='${requestmap.id}'/>
					</div>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
