<div class="panel panel-default">
    <g:form controller="${role!=null ? 'role' : 'user'}" method="DELETE" action="removeGroups">
    <div class="panel-heading">${panelTitle}</div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <g:render template="/group/rowCheckboxTemplate" var="group" collection="${groupList}" />
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">
        <g:if test="${role!=null}">
            <g:hiddenField name="roleId" value="${role.id}" />
            <div class="form-group">
                <g:submitButton name="removeGroup" value="Remove selected" class="btn btn-danger" />
            </div>
        </g:if>
        <g:if test="${user!=null}">
            <g:hiddenField name="userId" value="${user.id}" />
            <div class="form-group">
                <g:submitButton name="removeGroup" value="Remove selected" class="btn btn-danger" />
            </div>
        </g:if>
    </div>
    </g:form>
</div>
