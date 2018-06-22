function Jump(){
    var li=$(".main_top>ul>li");
    li.on('click',function(){
        li.removeClass("routeList");
        $(this).addClass("routeList");
        var aid=$(this).attr("aid");
        $(".main_bottom>div").removeClass("show").addClass("hide");
        $(".main_bottom>#jump"+aid).removeClass("hide").addClass("show");
    })
}

function Jump2(){
    var p=$(".mainLeft>p");
    p.on('click',function(){
        p.removeClass("left_sOn");
        $(this).addClass("left_sOn");
        var tid=$(this).attr("tid");
        $(".allRight>div").removeClass("show").addClass("hide");
        $(".allRight>#jump"+tid).removeClass("hide").addClass("show");
    })
}

Jump();
Jump2();