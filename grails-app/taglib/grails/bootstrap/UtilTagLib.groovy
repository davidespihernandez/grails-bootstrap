package grails.bootstrap

import org.grails.taglib.GrailsTagException

class UtilTagLib {
    static namespace = 'util'

    /**
     * @attr name             REQUIRED the HTML element name
     * @attr label            label for the checkbox
     * @attr checked          true or false
     */
    def checkbox = { attrs ->
        attrs = [:] + attrs

        String name = attrs.name
        if(!name){
            throw new GrailsTagException("name attribute is mandatory in a checkbox")
        }
        String checked = attrs.checked
        Boolean isChecked = false
        if(checked && checked.toString().toLowerCase()=='true'){
            isChecked = true
        }
        String label = attrs.label

        out << """<div class="form-group">
                    <div class="checkbox c-checkbox">
                        <label>
                            <input type="hidden" name="_${name}" /><input type="checkbox" name="${name}" id="${name}" ${isChecked ? "checked" : ""} />
                            <span class="fa fa-check"></span>${label}
                        </label>
                    </div>
                  </div>
               """
    }
}
