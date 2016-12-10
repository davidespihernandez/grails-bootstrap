<div class="panel panel-default">
    <g:form controller="role" method="DELETE" action="removeUsers">
    <div class="panel-heading">${panelTitle}</div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Full name</th>
                        <th>Email</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <g:render template="/user/rowCheckboxTemplate" var="user" collection="${userList}" />
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">
            <g:hiddenField name="roleId" value="${role.id}" />
            <div class="form-group">
                <g:submitButton name="removeUser" value="Remove selected" class="btn btn-danger" />
            </div>
            </span>
    </div>
    </g:form>
</div>
