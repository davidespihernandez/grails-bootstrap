<html>
<head>
	<meta name="layout" content="main"/>
	<title>Group list</title>
</head>
<body>
	<h3>
		Groups
		<small>Group list</small>
	</h3>
	<div class="row">
		<div class="col-sm-12">
			<g:link action="create" class="btn btn-primary pull-right">Create</g:link>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<!--<div class="panel-heading">Product list</div>-->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<s2ui:sortableColumn property='name' titleDefault='Name'/>
								</tr>
							</thead>
							<tbody>
								<g:each in='${groupList}' status='i' var='group'>
									<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
										<td><g:link action='edit' id='${group.id}'>${group.name}</g:link></td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
				<div class="panel-footer">
					<div class="text-center">
						${groupList.size() + " total groups"}
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
