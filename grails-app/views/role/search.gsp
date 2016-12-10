<html>
<head>
	<meta name="layout" content="main"/>
	<title>Role search</title>
</head>
<body>
	<h3>
		Role search
		<small>Search existing roles</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:render template="/shared/notificationTemplate" />
			<g:form action="search" controller="role" method="POST" name="search" id="search">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group">
								<label class="control-label">Authority</label>
								<g:textField name='authority' size='50' maxlength='255' autocomplete='off' value='${authority}' class="form-control"/>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-sm-12">
							<g:actionSubmit controller="role" action="search" value="Search" class="btn btn-primary pull-left" />
							<g:link action="create" class="btn btn-primary pull-right">Create</g:link>
						</div>
					</div>
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
										<s2ui:sortableColumn property='authority' titleDefault='Authority'/>
									</tr>
								</thead>
								<tbody>
									<g:each in='${results}' status='i' var='role'>
										<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
											<td><g:link action='edit' id='${role.id}'>${role.authority}</g:link></td>
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
<s2ui:ajaxSearch paramName='authority' minLength='2'/>
</body>
</html>
