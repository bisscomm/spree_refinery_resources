Spree.routes.resource_search = Spree.pathFor('api/v1/resources')

$(document).ready(function () {
  'use strict';

  if ($('#product_resource_ids').length > 0) {
    $('#product_resource_ids').select2({
      placeholder: Spree.translations.resource_placeholder,
      multiple: true,
      initSelection: function (element, callback) {
        var url = Spree.url(Spree.routes.resource_search, {
          ids: element.val(),
          token: Spree.api_key
        });
        return $.getJSON(url, null, function (data) {
          return callback(data);
        });
      },
      ajax: {
        url: Spree.routes.resource_search,
        quietMillis: 200,
        datatype: 'json',
        data: function (term) {
          return {
            q: {
              title_cont: term,
              file_name_cont: term
            },
            token: Spree.api_key
          };
        },
        results: function (data) {
          return {
            results: data
          };
        }
      },
      formatResult: function (resource) {
        return resource.title;
      },
      formatSelection: function (resource) {
        return resource.title;
      }
    });
  }
});