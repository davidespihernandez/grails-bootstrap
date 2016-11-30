<div class="panel panel-default">
    <!--<div class="panel-heading">Product list</div>-->
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th><g:message code="id" /></th>
                        <th><g:message code="code" /></th>
                        <th><g:message code="description" /></th>
                    </tr>
                </thead>
                <tbody>
                    <g:render template="rowTemplate" var="product" collection="${productList}" />
                </tbody>
            </table>
        </div>
    </div>
</div>
