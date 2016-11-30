<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="product.list" /></title>
    </head>
    <body>
        <h3>
            ${product.code}
            <small>Product detail</small>
        </h3>
        <div class="row">
            <div class="col-sm-12">
                <span>
                    <g:link class="btn btn-success btn-labeled" action="create">
                        <span class="btn-label"><i class="fa fa-plus"></i>
                        </span><g:message code="product.create" />
                    </g:link>
                </span>
                <span>
                    <g:link action="index">Product list</g:link>
                </span>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <g:if test="${flash.message}">
                    <div role="alert" class="alert alert-info">${flash.message}</div>
                </g:if>
                <div class="form-group">
                    <label class="control-label">Id *</label>
                    <g:textField name="id" value="${product.id}" required class="form-control" disabled="true" />
                </div>
                <div class="form-group">
                    <label class="control-label">Code *</label>
                    <g:textField name="code" value="${product.code}" required class="form-control" disabled="true" />
                </div>
                <div class="form-group">
                    <label class="control-label">Description *</label>
                    <g:textField name="description" value="${product.description}" required class="form-control" disabled="true" />
                </div>
                <div class="required">* Required fields</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <span>
                    <g:link class="btn btn-default" action="edit" resource="${this.product}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </span>
                <span>
                    <g:link controller="product" action="delete" method="delete" class="btn btn-danger" resource="${this.product}" onclick="return confirm('Are you sure?');">Delete</g:link>
                </span>
            </div>
        </div>
    </body>
</html>
