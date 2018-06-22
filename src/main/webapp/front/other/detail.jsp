<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>detail</title>
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
                    <li>线路</li>
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

        <div class="detail">
            <div class="detail_img">
                <div><img src="${APP_PATH}${line.image }" /></div>
                <div class="detail_imgText">
                    <h5>${line.title }</h5>
                    <p>
                        ${line.introduce }
                    </p>
                    <strong>
                        价格:<em>￥${line.price }</em>
                    </strong>
                    <form class="form-horizontal">
                        <p>
                            <label>选择旅行团:</label>
                            <div class="col-sm-6">
                                <select id="select">
                                    <c:forEach items="${teamList }" var="team">
                                        <option value="${team.id }">${team.teamName }：${team.goTime }出发</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </p>
                        <p><button id="teamButton" type="button">确认</button></p>
                    </form>
                </div>
            </div>
            <div class="detail_intro">
                <h5>行程介绍</h5>
                <p>${line.route }</p>
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
            var tid = $("#select").val();
            console.log(tid);
            window.location.href = "${APP_PATH}/Team/findToTeam?id=" + tid + "";
        });
    </script>
</body>
</html>