*{
 *  insert a script tag in the template.
 *  by convention, referred script must be put under /public/javascripts
 *    src     (required)   : script filename, without the leading path "/public/javascripts"
 *    id      (opt.)       : sets script id attribute
 *    charset (opt.)       : sets source encoding - defaults to UTF-8
 *    #{cdn.script id:'datepicker' , src:'ui/ui.datepicker.js', charset:'utf-8' /}
}*
%{
    ( _arg ) &&  ( _src = _arg);

    if(! _src) {
        throw new play.exceptions.TagInternalException("src attribute cannot be empty for script tag");
    }
    _domain = play.configuration.getProperty("script_path", "");

}%
<script type="text/javascript" language="javascript"#{if _id} id="${_id}"#{/if}#{if _charset} charset="${_charset}"#{/if}  src="#{if _domain}${_domain}#{/if}/${_src}"></script>
