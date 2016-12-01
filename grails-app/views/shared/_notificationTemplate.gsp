<g:if test="${flash.message}">
    <div role="alert" class="alert alert-warning alert-dismissible fade in">
       <button type="button" data-dismiss="alert" aria-label="Close" class="close">
          <span aria-hidden="true">&times;</span>
       </button>
       <strong>
            ${flash.message}
        </strong>
    </div>
</g:if>
