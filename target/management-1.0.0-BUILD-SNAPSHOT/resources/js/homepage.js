$().ready(function () {
    console.log("hello");

    $(".opq-header").mouseover(function () {
        $(".opq-header").css("background", "white");
        $(".opq-header a").css("color", "black");
        $(".logo-img").attr("src", "resources/img/logo2.png");
    });

    // 대학 소개 마우스 올릴 시 slidedown 이벤트 발생
    $("#uni-detail").mouseover(function () {
        $(".opq-header-sub").slideDown(600);
        $(".opq-header").css("background", "white");
        $(".opq-header a").css("color", "black");
        $("#login-btn").css("color", "white");
    });

    // header 스크롤시 색 변경
    $(window).on('scroll', function () {
        let scrollPosition = $(window).scrollTop();

// addclass로 해볼 것.

        if (scrollPosition > 0) {
            $('.opq-header').css('background-color', 'white');
            $(".opq-header a").css("color", "black");
            $(".logo-img").attr("src", "resources/img/logo2.png");
            $(".opq-header-sub").css("display", "none");
        } else {
            $('.opq-header').css('background-color', 'rgba(0, 0, 0, .2)');
            $(".opq-header a").css("color", "white");
            $(".logo-img").attr("src", "resources/img/logo.png");
        }
    });

    // header 벗어나면 헤더 효과 풀림
    let subheaderHeight = $('.opq-header-sub').outerHeight();
    let totalHeaderHeight = 65 + subheaderHeight;

    $(document).on('mousemove', function (event) {
        // 마우스의 Y 좌표가 헤더와 서브헤더의 총 높이보다 클 경우 이벤트 발생
        if (event.clientY > totalHeaderHeight) {
            $('.opq-header').css('background-color', 'rgba(0, 0, 0, .2)');
            $(".opq-header a").css("color", "white");
            $(".logo-img").attr("src", "resources/img/logo.png");
            $(".opq-header-sub").css("display", "none");
        }
    });

    // subheader 강조 표시
    let way = $(".opq-header-sub #way");
    let ideo = $(".opq-header-sub #ideo");
    let prof = $(".opq-header-sub #prof");
    let dept = $(".opq-header-sub #dept");
    let calendar = $(".opq-header-sub #calendar");

    way.on('mouseover', function () {
        way.css("color", "#024C86");
    });
    way.on('mouseout', function () {
        way.css("color", "#333");
    });
    ideo.on('mouseover', function () {
        ideo.css("color", "#024C86");
    });
    ideo.on('mouseout', function () {
        ideo.css("color", "#333");
    });
    prof.on('mouseover', function () {
        prof.css("color", "#024C86");
    });
    prof.on('mouseout', function () {
        prof.css("color", "#333");
    });
    dept.on('mouseover', function () {
        dept.css("color", "#024C86");
    });
    dept.on('mouseout', function () {
        dept.css("color", "#333");
    });
    calendar.on('mouseover', function () {
        calendar.css("color", "#024C86");
    });
    calendar.on('mouseout', function () {
        calendar.css("color", "#333");
    });

});