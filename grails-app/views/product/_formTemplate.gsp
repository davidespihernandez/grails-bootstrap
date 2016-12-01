<g:hiddenField name="version" value="${product?.version}" />
<div class="form-group">
    <label class="control-label">Code *</label>
    <g:textField name="code" value="${product?.code}" required class="form-control" disabled="${disabled}" />
</div>
<div class="form-group">
    <label class="control-label">Description *</label>
    <g:textField name="description" value="${product?.description}" required class="form-control" disabled="${disabled}" />
</div>
<div class="required">* Required fields</div>
