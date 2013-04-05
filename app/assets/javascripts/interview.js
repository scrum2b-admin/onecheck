
$(".remove_question_on_edit").live("click",function(){
  var question_id = parseInt($("#div_list_question").attr("question_max_number"));
  question_id = question_id - 1;
  $("#div_list_question").attr("question_max_number", question_id);
  var question_remove = $(this).parent().parent();
  question_remove.remove();
  var number =1 
  $(".question").each(function(){
  $(this).find(".no_number").text(number);
  number ++;
  });
  return false;
});










