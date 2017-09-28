$(document).ready(function(){
  $("button.edit").click(function(e){
    event.preventDefault();
    $(".edit-ingredients").removeClass("hide");
  });

  $('.ratings_stars').hover(
            // Handles the mouseover
            function() {
                $(this).prevAll().addBack().addClass('ratings_over');
                $(this).nextAll().removeClass('ratings_vote');
            },
            // Handles the mouseout
            function() {
                $(this).prevAll().addBack().removeClass('ratings_over');
                set_votes($(this).parent());
            }
        );

        $('.rate_widget').each(function(i) {
           var widget = this;
           var out_data = {
               widget_id : $(widget).attr('id'),
               fetch: 1
           };
           $.post(
               '/',
               out_data,
               function(INFO) {
                   $(widget).data( 'fsr', INFO );
                   set_votes(widget);
               },
               'json'
           );
       });
});

function set_votes(widget) {

            var avg = $(widget).data('fsr').whole_avg;
            var votes = $(widget).data('fsr').number_votes;
            var exact = $(widget).data('fsr').dec_avg;

            $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
            $(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote');
            $(widget).find('.total_votes').text( votes + ' votes recorded (' + exact + ' rating)' );
        }
