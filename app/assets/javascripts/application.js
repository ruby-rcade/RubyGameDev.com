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

$(function(){
  $('.tags-input').on('keyup', function() {
    var word = $(this).val();
      // if(word === ""){
      //   return; 
      // }
    var exp = new RegExp('^' + word, 'i');

    console.log(word);

    $('.tags-box .list-autocomplete li' ).each(function(){
      console.log($(this).text() + word + input);
      var isMatch = exp.test($(this).text());

      console.log(isMatch);

      if(isMatch){
        $(this).show();
      }
      else{
        $(this).hide();
      }
    });

    $('.tags-box').addClass('active');

    $('.tags-box').on('click', 'li', function() {
      var newTag = $(this).text();


      var tags = $('.tags-input').val().split(/,\s*/);
      if (tags[0] === "") {
        // remove first empty string
        tags.splice(0, 1);
      }
      tags.push(newTag);

      $('.tags-input').val(tags.join(', '));
      $('.tags-box').removeClass('active');
    });
  });
});

// for each li
// if li.text() ~~ currently written word
// li.show()
// else
// li.hide()
//

    // $('.list-autocomplete').find('<li>');
    //   $('<li>').each(function(li){
    //     if(li.text() === 'rails'){
    //       li.show();

    //       console.log(li);
    //     }
    //     else{
    //       $('.tags-box').removeClass('active');
    //     } 
    //   });
