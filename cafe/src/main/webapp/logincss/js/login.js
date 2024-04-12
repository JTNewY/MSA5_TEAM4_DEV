$(function() {

    // 코드 작성
    $('#signup').click(function() {
        $('.pinkbox').css('transform', 'translateX(80%)');
        $('.signin').addClass('nodisplay');
        $('.signup').removeClass('nodisplay');
    });
    
    $('#signin').click(function() {
        $('.pinkbox').css('transform', 'translateX(0%)');
        $('.signup').addClass('nodisplay');
        $('.signin').removeClass('nodisplay');
    });
})