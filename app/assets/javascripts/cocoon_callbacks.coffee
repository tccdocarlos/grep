jQuery(document).on 'turbolinks:load', ->
    bill_splitings = $('#bill_splitings')

    bill_splitings.on 'cocoon:after-insert', (e, added_el) ->
      added_el.find('input').first().focus();

    bill_splitings.on 'cocoon:before-remove', (e, el_to_remove) ->
      $(this).data('remove-timeout', 1000);
      el_to_remove.fadeOut(1000);

    bill_apportionments = $('#bill_apportionments')

    bill_apportionments.on 'cocoon:after-insert', (e, added_el) ->
      added_el.find('input').focus();

    bill_apportionments.on 'cocoon:before-remove', (e, el_to_remove) ->
      $(this).data('remove-timeout', 1000);
      el_to_remove.fadeOut(1000);

    bill_splitings.on 'focus', () -> 
      console.log("foi focado");