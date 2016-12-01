<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>New product</title>
    </head>
    <body>
        <h3>
            Product
            <small>New product</small>
        </h3>
        <div class="row">
            <div class="col-sm-12">
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
                    <g:form url="[resource: this.product, action:'save']" method="POST">
                        <div class="panel-heading">Product info</div>
                        <div class="panel-body">
                            <g:render template="formTemplate" model="[product: product, disabled: false]" />
                        </div>
                        <div class="panel-footer">
                            <g:actionSubmit controller="product" action="save" value="${message(code: 'default.button.create.label')}" class="btn btn-primary" resource="${this.product}" />
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
