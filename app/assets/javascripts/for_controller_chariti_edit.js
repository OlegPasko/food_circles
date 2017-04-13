document.addEventListener("turbolinks:load", function() {
  $("#charity-settings-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-dashboard').hide();
    $('#charity-settings').show();
});

$("#charity-activity-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-dashboard').hide();
    $('#charity-activity').show();
});

$("#charity-restaurants-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-dashboard').hide();
    $('#charity-restaurants').show();
});

$("#charity-bank-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-dashboard').hide();
    $('#charity-bank').show();
});

$("#charity-search-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-restaurants').hide();
    $('#charity-restaurants-search').show();
});

$("#charity-manage-link").click(function(e) {
    e.preventDefault();
    $(this).parents("ul").find("li").removeClass('active');
    $(this).addClass('active');
    $('.charity-restaurants').hide();
    $('#charity-restaurants-manage').show();
});

});
