<html>
<head>
	<meta name="layout" content="main"/>
	<s2ui:title messageCode='spring.security.ui.requestmap.search'/>
</head>
<body>
	<h3>
		<g:message code="spring.security.ui.requestmap.search" />
		<small>Search existing requestmap</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:form action="search" controller="requestmap" method="POST" name="search" id="search">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-4">
							<div class="form-group">
								<label class="control-label"><g:message code='requestmap.url.label' default='URL'/></label>
								<g:textField name='url' size='50' maxlength='255' autocomplete='off' value='${url}' class="form-control"/>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="form-group">
								<label class="control-label"><g:message code='requestmap.configAttribute.label' default='Config Attribute'/></label>
								<g:textField name='configAttribute' size='50' maxlength='255' autocomplete='off' value='${configAttribute}' class="form-control"/>
							</div>
						</div>
						<div class="col-lg-4">
							<g:if test='${hasHttpMethod}'>
								<div class="form-group">
									<label class="control-label"><g:message code='requestmap.httpMethod.label' default='HTTP Method'/></label>
									<g:select name='httpMethod' from='${org.springframework.http.HttpMethod.values()}' value='${httpMethod}' noSelection="['null': 'All']" class="form-control m-b"/>
								</div>
							</g:if>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<g:actionSubmit controller="requestmap" action="search" value="Search" class="btn btn-primary" />
				</div>
			</div>
			</g:form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<g:if test='${searched}'>
				<div class="panel panel-default">
					<!--<div class="panel-heading">Product list</div>-->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<s2ui:sortableColumn property='url' titleDefault='URL'/>
										<s2ui:sortableColumn property='configAttribute' titleDefault='Config Attribute'/>
										<g:if test='${hasHttpMethod}'><s2ui:sortableColumn property='httpMethod' titleDefault='HttpMethod'/></g:if>
									</tr>
								</thead>
								<tbody>
									<g:each in='${results}' status='i' var='requestmap'>
										<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
											<td><g:link action='edit' id='${requestmap.id}'>${uiPropertiesStrategy.getProperty(requestmap, 'url')}</g:link></td>
											<td>${uiPropertiesStrategy.getProperty(requestmap, 'configAttribute')}</td>
											<g:if test='${hasHttpMethod}'><td>${uiPropertiesStrategy.getProperty(requestmap, 'httpMethod')}</td></g:if>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel-footer">
						<s2ui:paginate total='${totalCount}'/>
					</div>
				</div>
			</g:if>
		</div>
	</div>
<s2ui:ajaxSearch paramName='url'/>
<s2ui:ajaxSearch paramName='configAttribute' focus='false'/>
</body>
</html>
