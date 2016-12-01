<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Product update</title>
    </head>
    <body>
        <h3>
            Product
            <small>Update product</small>
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
                <g:hasErrors bean="${this.product}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.product}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div class="panel panel-default">
                    <div class="panel-heading">Product: ${product.code}</div>
                    <div class="panel-body">
                        <g:render template="formTemplate" model="[product: product, disabled: false]" />
                    </div>
                    <div class="panel-footer">
                        <g:form url="[resource: this.product, action:'save']" method="PUT">
                            <g:actionSubmit controller="product" action="save" value="${message(code: 'default.button.update.label')}" class="btn btn-primary" resource="${this.product}" />
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
