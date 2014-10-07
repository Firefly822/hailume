/**
 * Created by firefly on 2014/10/2.
 */
jQuery(document).ready(function(){
    $('#publish').click(function(){
        var editor = UM.getEditor("container");
        $('#detaildiv').html(editor.getContent());
    });
});