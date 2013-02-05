var ChangeIndexContent = function(id){
    var currentContent = $('.switchable.current');
    var targetContent = $('.switchable[data-id="'+id+'"]');
    currentContent.removeClass('current');
    currentContent.hide();
    targetContent.addClass('current');
    targetContent.show();
}

var IndexSlider = function(){
    $('#index-slider').bxSlider({
            pager: false,
            nextSelector: '#index-slider-left',
            prevSelector: '#index-slider-right',
            nextText: '',
            prevText: '',
            onSlideNext: function(newIndex){ChangeIndexContent(newIndex.attr('data-id'))},
            onSlidePrev: function(newIndex){ChangeIndexContent(newIndex.attr('data-id'))},
        });
}

$(function(){
    IndexSlider();
});