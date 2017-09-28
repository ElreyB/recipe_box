$(document).ready(function(){
  $("button.edit").click(function(e){
    event.preventDefault();
    $(".edit-ingredients").removeClass("hide");
  });
});
