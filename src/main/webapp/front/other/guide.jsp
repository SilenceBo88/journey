<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>guide</title>
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link href="${APP_PATH}/front/css/public.css" rel="stylesheet" type="text/css">
    <link href="${APP_PATH}/front/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
    <%--页头--%>
    <jsp:include page="${APP_PATH}/front/header.jsp"/>

    <%--导航--%>
    <div class="navList comWidth">
        <div class="nav_left">
            <a href="${APP_PATH}/index.jsp"><img src="${APP_PATH}/front/images/logo.png" /></a>
        </div>
        <div class="nav_right">
            <ul>
                <a href="${APP_PATH}/Line/findToRoute">
                    <li >线路</li>
                </a>
                <a href="${APP_PATH}/Notice/findoToNotice">
                    <li>公告</li>
                </a>
                <a href="${APP_PATH}/front/other/guide.jsp">
                    <li class="xl">成为导游</li>
                </a>
            </ul>
        </div>
    </div>

    <%--内容--%>
    <div class="comWidth">
        <form class="form-horizontal" method="post" id="form">
            <div class="form-group">
                <label for="realName" class="col-sm-2 control-label">真实姓名:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="realName" placeholder="name" name="tourGuide.realName">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别:</label>
                <div class="col-sm-6">
                    <label class="radio-inline">
                        <input type="radio" name="tourGuide.sex" id="sex1" value="0" checked> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="tourGuide.sex" id="sex2" value="1"> 女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="age" class="col-sm-2 control-label">年龄:</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="age" placeholder="age" name="tourGuide.age">
                </div>
            </div>
            <div class="form-group">
                <label for="guidePhone" class="col-sm-2 control-label">电话:</label>
                <div class="col-sm-6">
                    <input type="tel" class="form-control" id="guidePhone" placeholder="phone" name="tourGuide.phone">
                </div>
            </div>
            <div class="form-group">
                <label for="introduce" class="col-sm-2 control-label">个人介绍:</label>
                <div class="col-sm-6">
                    <textarea class="form-control" rows="3" id="introduce" placeholder="介绍一下自己" name="tourGuide.introduce"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-sm-2 control-label">导游类型:</label>
                <div class="col-sm-6">
                    <select class="form-control" id="type" name="tourGuide.type">
                        <option value="0">周边游</option>
                        <option value="1">国内游</option>
                        <option value="2">国际游</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <button type="button" class="btn btn-primary" id="submit">提交</button>
                </div>
            </div>
        </form>
    </div>

    <%--页尾--%>
    <jsp:include page="${APP_PATH}/front/footer.jsp"/>

    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $("#submit").click(function(){
            var guidePhone = $("#guidePhone").val();
            if(!isPoneAvailable2(guidePhone)){
                alert(guidePhone);
                alert("手机号格式不正确");
                return false;
            }

            $.ajax({
                type : "POST",  //提交方式
                url : "${APP_PATH }/json/TourGuide/register",//路径
                data : $("#form").serialize(), //数据，这里使用的是Json格式进行传输
                success : function(result) {//返回数据根据结果进行相应的处理
                    if ( result.status == 200 ) {
                        alert("注册成功");
                        window.location.href = "${APP_PATH}/Line/findByRecommend";
                    } else {
                        alert("注册失败");
                    }
                }
            });
        });

        function isPoneAvailable2(str) {
            var myreg=/(\+86)?\s*1[345789]\d{9}/;
            if (myreg.test(str)) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</body>
</html>