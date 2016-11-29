<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="product.list" /></title>
    </head>
    <body>
        <h3><g:message code="product.list" />
            <small>The complete list of products</small>
        </h3>
        <div class="row">
            <div class="col-sm-12">
                <g:link class="btn btn-success btn-labeled" action="create">
                    <span class="btn-label"><i class="fa fa-plus"></i>
                    </span><g:message code="product.create" />
                </g:link>
            </div>
        </div>
        <div id="list-product" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div role="alert" class="alert alert-info">${flash.message}</div>
            </g:if>
            <f:table collection="${productList}" />

            <div class="pagination">
                <g:paginate total="${productCount ?: 0}" />
            </div>
        </div>
    </body>
</html>