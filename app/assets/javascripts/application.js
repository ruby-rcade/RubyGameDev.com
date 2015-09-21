// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  $('#welcome_message').bind('closed.bs.alert', function() {
    var form = $('#welcome_message').next('form');
    $.post(form.attr('action'), form.serialize());
  });

  $('#digest_signup_form')
    .bind("ajax:success", function(data, status, xhr) {
        alert('Success.');
    })
    .bind("ajax:error", function(xhr, status, error) {
        alert('Failed.');
    });
});

$(function() {
  $('.tags-input').autocomplete({
    minLength: 1,
    source: "/tags.json",
    autoFocus: true,

    focus: function() {
      // prevent value inserted on focus
      return false;
    },

    select: function(event, ui) {
      var terms = this.value.split(/,\s*/);
      // remove the current input
      terms.pop();
      // add the selected item
      terms.push(ui.item.value);
      // add an empty item for a trailing comma
      terms.push("");

      this.value = terms.join(", ");
      $(this).autocomplete('close');
      return false;
    }
  });

  $('.tags-input').on('blur', function() {
    // remove any trailing commas
    this.value = this.value.replace(/,\s*$/, '');
  });
});

$(function() {
  $(".vote-count a").on('click', function() {
    var link = $(this);
    var url = $(this).attr('href');

    $.ajax({
      url: url,
      type: "PUT",

      success: function(response) {
        link.replaceWith(response);
      }
    });

    return false;
  });
});

$(function() {
  $(".post-link").on('click', function() {
    var link = $(this);
    var url = link.attr('href');
    var container = link.parent('td');

    if (container.find('.post-summary:visible').length > 0) {
      $('.post-summary').slideUp();
    } else if (container.find('.post-summary:hidden').length > 0) {
      container.find('.post-summary:hidden').slideDown();
    } else {
      $('.post-summary').slideUp();

      $.ajax({
        url: url,
        success: function(response) {
          var postSummary = $(response);
          postSummary.hide();
          container.append(postSummary);
          postSummary.slideDown();
        }
      })
    }

    return false;
  });
});