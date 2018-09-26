jQuery(document).on 'turbolinks:load', ->
    bill_splitings = $('#bill_splitings')

    bill_splitings.on 'cocoon:after-insert', (e, added_el) ->
      added_el.find('input').first().focus();

    bill_splitings.on 'cocoon:before-remove', (e, el_to_remove) ->
      $(this).data('remove-timeout', 1000);
      el_to_remove.fadeOut(1000);