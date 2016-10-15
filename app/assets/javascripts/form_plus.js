// add_new_form click
// hide_formがapeear_form
// add_new_formにstyle display: noneを追加
// turbolinkをみる
$(document).on("ready page:load", function(){
  $("#add_new_form").on("click",function(){
    $("#plus").removeClass('hide_foem');
    $("#plus").addClass('appear_form');
    $("#plus").css('display', 'list-item');
    $("#add_new_form").css('display', 'none');
  });
});


