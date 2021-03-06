*{
 *  create a link element for a CSS file under /public/stylesheets
 *  src (required) filename without the leading path "/public/stylesheets"
 *  id (optional) an id attribute for the generated link tag
 *  media (optional) media : screen, print, aural, projection ...
 *  title (optional) title atttribute (or description)
 *    #{cdn.stylesheet src:'default.css',media:'screen,print' /}
}*
%{
    ( _arg ) &&  ( _src = _arg);

    if(! _src) {
        throw new play.exceptions.TagInternalException("src attribute cannot be empty for stylesheet tag");
    }
	_domain = play.configuration.getProperty("stylesheet_path", "");
}%
<link rel="stylesheet" type="text/css"#{if _id} id="${_id}"#{/if}#{if _title} title="${_title}"#{/if} href="#{if _domain}${_domain}#{/if}/${_src}"#{if _media} media="${_media}"#{/if} charset="utf-8" ></link>
