<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Product detail</title>
    </head>
    <body>
        <h3>
            Product
            <small>Product detail</small>
        </h3>
        <div class="row">
            <div class="col-sm-12">
                <span>
                    <g:link class="btn btn-success btn-labeled" action="create">
                        <span class="btn-label"><i class="fa fa-plus"></i></span>
                        <g:message code="product.create" />
                    </g:link>
                </span>
                <span>
                    <g:link action="index" class="btn btn-primary btn-labeled">
                        <span class="btn-label"><i class="fa fa-list"></i></span>
                        <g:message code="product.list" />
                    </g:link>
                </span>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <g:render template="/shared/notificationTemplate" />
                <div class="panel panel-default">
                    <div class="panel-heading">Product: ${product.code}</div>
                    <div class="panel-body">
                        <g:render template="formTemplate" model="[product: product, disabled: true]" />
                    </div>
                    <div class="panel-footer">
                        <g:form url="[resource: this.product, action:'delete']" method="DELETE">
                            <g:link class="btn btn-primary" action="edit" resource="${this.product}">
                                <g:message code="default.button.edit.label" default="Edit" />
                            </g:link>
                            <g:actionSubmit controller="product" action="delete" value="${message(code: 'default.button.delete.label')}" class="btn btn-danger pull-right" resource="${this.product}" onclick="return confirm('Are you sure?');" />
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
