<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>team</title>
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
                <li>成为导游</li>
            </a>
        </ul>
    </div>
</div>

<%--内容--%>
<div class="comWidth">

    <div class="team">
        <div class="team_img">
            <div><img src="${APP_PATH}${image }" /></div>
            <div class="team_imgText">
                <div class="team_list">
                    <ul>
                        <li><span><strong>团队名称：</strong><em>${team.teamName }</em></span></li>
                        <li><span><strong>导游：</strong><em>${team.tg_name }</em></span></li>
                        <li><span><strong>导游电话：</strong><em>${team.tg_phone }</em></span></li>
                        <li><span><strong>出发时间：</strong><em>${team.goTime }</em></span></li>
                    </ul>
                    <ul>
                        <li><span><strong>最大人数：</strong><em>${team.maxNum }</em></span></li>
                        <li><span><strong>已有人数：</strong><em>${team.hasNum }</em></span></li>
                        <li><span><strong>团队状态：</strong><em>
                            <c:if test="${team.status eq 0 }">
                                未出发
                            </c:if>
                            <c:if test="${team.status eq 1 }">
                                已出发
                            </c:if>
                            <c:if test="${team.status eq 2 }">
                                已结束
                            </c:if>
                        </em></span></li>
                        <li><span><strong>所属线路：</strong><em>${team.lname }</em></span></li>
                    </ul>
                </div>
                <button id="teamButton">预定</button>
            </div>
        </div>

    </div>

</div>

<%--页尾--%>
<jsp:include page="${APP_PATH}/front/footer.jsp"/>

<script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    // 1.选择h2元素，调用animate()方法
    //第1个参数是对象字面量：字间距变为.8em，做内边距变为.8em
    //第2个参数是动画持续1500毫
    $('h4').animate({
        letterSpacing: '.8em',
        paddingLeft: '.8em',
        fontSize: '1.5em'
    },1500);



    $("#teamButton").click(function(){
        if("${sessionScope.user }"== ""){
            alert("您没有登录，请登录后操作");
        }else {
            var msg = "您确定预定吗？\n\n请确认！";
            if (confirm(msg)==true){
                window.location.href = "${APP_PATH}/Order/add?order.tid=${team.id }"
                        + "&order.uid=${sessionScope.user.id }&order.t_Name=${team.teamName }"
                        +"&order.goTime=${team.goTime }&order.tg_name=${team.tg_name }"
                        +"&order.tg_phone=${team.tg_phone }&order.u_name=${sessionScope.user.realName }"
                        +"&order.u_phone=${sessionScope.user.phone }&order.status=0";
            }
        }
    });
</script>
</body>
</html>