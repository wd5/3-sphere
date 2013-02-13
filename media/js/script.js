var SizeChooser = function(){
    var isCalcPage = $('.size-chooser').hasClass('calc-size-chooser');

    ValuesForModal = function(){
        var currentHeight = $('.calc-form .size-height').html();
        var currentWidth = $('.calc-form .size-width').html();
        var currentLength = $('.calc-form .size-length').prop('value');
        var isWithWarm = $('.calc-form .warm-checkbox').prop('checked');
        if(isWithWarm){
            var price = parseInt($('.calc-form .price-warm-value').html())
        }else{
            var price = parseInt($('.calc-form .price-value').html())
        }

        var square = parseFloat(currentWidth)*parseFloat(currentLength);
        var total = square*price;

        $('.size-width').html(currentWidth);
        $('.size-height').html(currentHeight);
        $('.size-length').html(currentLength + ' м');
        $('.total-value').html(total);
    }

    var ChangeCalcFormValues = function(){
        var currentHeight = $('.size-chooser .height-chooser li.current .value').html();
        var currentWidth = $('.size-chooser .width-chooser li.current .value').html();
        $('.size-width').html(currentWidth);
        $('.size-height').html(currentHeight);
    }

    var CalculateTotal = function(){
        var currentWidth = parseFloat($('.calc-form .size-width').html());
        var currentLength = parseFloat($('.calc-form .size-length').prop('value'));
        var isWithWarm = $('.calc-form .warm-checkbox').prop('checked');
        if(isWithWarm){
            var price = parseInt($('.calc-form .price-warm-value').html())
        }else{
            var price = parseInt($('.calc-form .price-value').html())
        }

        var square = currentWidth*currentLength;
        var total = square*price;
        $('.total-value').html(total);
    }

    var SelectSize = function(id){
        $('.arc-b').removeClass('current');
        $('.arc-b[data-id="'+id+'"]').addClass('current');
        $('.height-chooser li').removeClass('current');
        $('.height-chooser li[data-id="'+id+'"]').addClass('current');
        $('.width-chooser li').removeClass('current');
        $('.width-chooser li[data-id="'+id+'"]').addClass('current');

        if(isCalcPage){
            ChangeCalcFormValues();
            CalculateTotal();
        };
    }

    var OpenHeightChooser = function(){
        $('.closed-height-chooser').addClass('opened-height-chooser');
        $('.closed-height-chooser').removeClass('closed-height-chooser');
    }

    var CloseHeightChooser = function(){
        $('.opened-height-chooser').addClass('closed-height-chooser');
        $('.opened-height-chooser').removeClass('opened-height-chooser');
    }

    $('.size-chooser').on('click', '.closed-height-chooser li.current a', function(e){
        e.preventDefault();
        OpenHeightChooser();
    });

    $('.size-chooser').on('mouseleave', '.opened-height-chooser', function(){
        CloseHeightChooser();
    });

    $('.size-chooser').on('click', '.opened-height-chooser a', function(e){
        e.preventDefault();
        var currentId = $(this).parent('li').attr('data-id');
        CloseHeightChooser();
        SelectSize(currentId);
    });

    $('area').hover(function(){
        var currentId = $(this).attr('data-id');
        $('.arc-y[data-id="'+currentId+'"]').addClass('current');
    }, function(){
        $('.arc-y').removeClass('current');
    });

    $('area').on('click', function(){
        var currentId = $(this).attr('data-id');
        SelectSize(currentId);        
    });

    $('.size-length').on('change', function(){
        CalculateTotal();
    });

    $('.warm-checkbox').on('change', function(){
        CalculateTotal();
    });

    if(isCalcPage){
        CalculateTotal();
    };
}

var CalculationForm = function(){
    $('.fancybox-ajax').fancybox({
        type: 'ajax',
        padding: 0,
        beforeShow: ValuesForModal
    });

    $('body').on('submit', '.calc-message-form', function(e){
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(data){
                if(data['success'] == 1){
                    window.location = data['success_url']
                } else {
                    $.fancybox(data, {
                        padding: 0,
                        beforeShow: ValuesForModal
                    });
                }
            }
        });
    });
}

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
            onSlidePrev: function(newIndex){ChangeIndexContent(newIndex.attr('data-id'))}
        });
}

var Fancybox = function(){
    $('.fancybox').fancybox({
        padding: 0
    });
};

$(function(){
    IndexSlider();
    Fancybox();
    SizeChooser();
    CalculationForm();
});