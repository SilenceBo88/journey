<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>order</title>
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
<div class="midd comWidth">
    <h4>消息：</h4>
    <h1 class="text-center" style="color: coral">恭喜！预定成功</h1>
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
</script>
</body>
</html>