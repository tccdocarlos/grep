# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on 'turbolinks:load', ->
  $("#bill_spliting_value").focus(() ->
    $("#radio_value").attr('checked', true);
    $("#bill_spliting_percentage_value").prop( "disabled", true );
  );

  $("#bill_spliting_percentage_value").focus(() -> 
    $("#radio_percentage_value").attr('checked', true);
    $("#bill_spliting_value").prop( "disabled", true );
  );

  $("#radio_value").click(() ->
    $("#bill_spliting_value").prop( "disabled", false );
    $("#bill_spliting_percentage_value").prop( "disabled", true );
  );
  

  $("#radio_percentage_value").click(() ->
    $("#bill_spliting_percentage_value").prop( "disabled", false );
    $("#bill_spliting_value").prop( "disabled", true );
  );