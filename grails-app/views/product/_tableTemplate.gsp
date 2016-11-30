<div class="table-responsive">
    <table class="table table-bordered table-hover">
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
