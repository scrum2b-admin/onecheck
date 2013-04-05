


$(".remove_question").live("click",function(){
  var question_id = parseInt($(".div_question").attr("question_max_number"));
  question_id = question_id - 1;
  var question_remove = $(this).parent().parent();
  question_remove.remove();
  var number =1 
  $(".question").each(function(){
  $(this).find(".no_number").text(number);
  number ++;
  });
  $(".div_question").attr("question_max_number", question_id);
  return false;
});
$(".remove_answer").live("click",function(){
  var class_add_answer = $(this).parent().parent().parent().parent().find(".add_answer");
  var number_answer = parseInt(class_add_answer.attr("answer_max_number"));
  var answer_remove = $(this).parent().parent();
  var answers = answer_remove.parent();
  number_answer = number_answer - 1;
 class_add_answer.attr("answer_max_number",number_answer);
  var number =1 ;
  answer_remove.remove();
  answers.find(".answers").each(function(){
  $(this).find(".no_answer").text(number);
  number ++;
  });
  return false;
});
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










