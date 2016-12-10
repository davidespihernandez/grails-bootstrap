<tr>
    <td>
        ${user.fullName}
    </td>
    <td>
        ${user.email}
    </td>
    <td>
        <div class="checkbox c-checkbox">
            <label>
                <g:checkBox name="selectedUsers" value="${user.id}" checked="false" />
                <span class="fa fa-check"></span>
            </label>
        </div>
    </td>
</tr>
