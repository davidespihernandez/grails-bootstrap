<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="product.list" /></title>
    </head>
    <body>
        <h3>
            <g:message code="product.list" />
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
        <br />
        <div class="row">
            <div class="col-sm-12">
                <g:render template="/shared/notificationTemplate" />
                <g:render template="tableTemplate" model="[productList: productList]" />
                <div class="pagination">
                    <g:paginate total="${productCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>