<div class="panel panel-default">
    <g:form controller="${group!=null ? 'group' : 'user'}" method="DELETE" action="removeRoles">
    <div class="panel-heading">${panelTitle}</div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Authority</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <g:render template="/role/rowCheckboxTemplate" var="role" collection="${roleList}" />
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">
        <g:if test="${group!=null}">
            <g:hiddenField name="groupId" value="${group.id}" />
            <div class="form-group">
                <g:submitButton name="removeRole" value="Remove selected" class="btn btn-danger" />
            </div>
        </g:if>
        <g:if test="${user!=null}">
            <g:hiddenField name="userId" value="${user.id}" />
            <div class="form-group">
                <g:submitButton name="removeRole" value="Remove selected" class="btn btn-danger" />
            </div>
        </g:if>
    </div>
    </g:form>
</div>
