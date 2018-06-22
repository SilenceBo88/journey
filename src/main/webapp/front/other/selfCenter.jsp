<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>me</title>
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
    <div class="mainInfo">
        <div class="mainLeft">
            <p tid="1" class="left_sOn">
                <i class="glyphicon glyphicon-user"></i><label>个人信息</label>
            </p>
            <p tid="2">
                <i class="glyphicon glyphicon-edit"></i><label>修改密码</label>
            </p>
            <p tid="3">
                <i class="glyphicon glyphicon-list-alt"></i><label>我的订单</label>
            </p>
        </div>
        <div class="allRight">
            <div class="main_right" id="jump1">
                <form class="col-sm-6 col-sm-offset-1" id="updateForm">
                    <input type="hidden" value="${myUser.id}" name="user.id">
                    <div class="form-group">
                        <label for="userName_me">昵称:</label>
                        <input type="text" name="user.userName" class="form-control" id="userName_me" value="${myUser.userName}"/>
                    </div>
                    <div class="form-group">
                        <label for="realName_me">真实姓名:</label>
                        <input type="text" name="user.realName" class="form-control" id="realName_me" value="${myUser.realName}"/>
                    </div>
                    <div class="form-group">
                        <label for="age_me">年龄:</label>
                        <input type="text" name="user.age" class="form-control" id="age_me" value="${myUser.age}"/>
                    </div>
                    <div class="form-group">
                        <label>性别:</label>
                        <label class="radio-inline">
                            <input type="radio" name="user.sex" value="0" <c:if test="${myUser.sex eq 0}">checked</c:if> > 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="user.sex" value="1" <c:if test="${myUser.sex eq 1}">checked</c:if>> 女
                        </label>
                    </div>
                    <button type="button" class="btn btn-default col-sm-offset-10" id="updateButton">修改</button>
                </form >
            </div>
            <div class="main_right hide" id="jump2">
                <form class="col-sm-6 col-sm-offset-1" id="updatePassForm">
                    <input type="hidden" value="${myUser.id}" name="user.id">
                    <div class="form-group">
                        <label for="oldPwd">旧密码:</label>
                        <input type="password" class="form-control" id="oldPwd"/>
                    </div>
                    <div class="form-group">
                        <label for="newPwd">新密码:</label>
                        <input type="password" name="user.passWord" class="form-control" id="newPwd"/>
                    </div>
                    <div class="form-group">
                        <label for="newPwd2">重复新密码:</label>
                        <input type="password" class="form-control" id="newPwd2"/>
                    </div>
                    <button type="button" class="btn btn-default col-sm-offset-10" id="updatePassButton">修改</button>
                </form >
            </div>
            <div class="main_right hide" id="jump3">
                <div class="col-sm-9">
                    <table class="table table-striped table-hover">
                        <%--表头--%>
                        <thead>
                        <tr>
                            <th>旅行团名</th>
                            <th>出发时间</th>
                            <th>导游姓名</th>
                            <th>导游电话</th>
                            <th>订单状态</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <%--显示数据--%>
                        <tbody>
                        <c:forEach items="${myOrderList }" var="order">
                            <tr>
                                <td>${order.t_Name }</td>
                                <td>${order.goTime }</td>
                                <td>${order.tg_name }</td>
                                <td>${order.tg_phone }</td>
                                <td>
                                    <c:if test="${order.status  eq 0}">
                                        未开始
                                    </c:if>
                                    <c:if test="${order.status eq 1}">
                                        进行中
                                    </c:if>
                                    <c:if test="${order.status eq 2}">
                                        已结束
                                    </c:if>
                                </td>
                                <td>${order.created }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--页尾--%>
<jsp:include page="${APP_PATH}/front/footer.jsp"/>

<script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/front/js/jump.js"></script>
<script type="text/javascript">
    $("#updateButton").click(function(){
        var userName = $("#userName_me").val();
        var realName = $("#realName_me").val();
        var age = $("#age_me").val();

        if(!isUserName(userName)){
            alert("昵称必须在2--6位之间");
            return false;
        }

        if(!isRealName(realName)){
            alert("真实姓名必须在2--4位之间");
            return false;
        }

        if(!isAge(age)){
            alert("年龄必须是数字");
            return false;
        }

        $.ajax({
            type : "POST",  //提交方式
            url : "${APP_PATH }/json/User/update",//路径
            data : $("#updateForm").serialize(), //数据，这里使用的是Json格式进行传输
            success : function(result) {//返回数据根据结果进行相应的处理
                if ( result.status == 200 ) {
                    alert("修改成功");
                    window.location.href="${APP_PATH }/User/myCenter?id=${myUser.id}";
                } else {
                    alert("修改失败");
                }
            }
        });
    });

    $("#updatePassButton").click(function(){
        var oldPwd = $("#oldPwd").val();
        var newPwd = $("#newPwd").val();
        var newPwd2 = $("#newPwd2").val();

        if ("${myUser.passWord}" != oldPwd){
            alert("旧密码错误");
            return false;
        }

        if (isPassWord(newPwd, newPwd2) == 1){
            alert("新密码必须在4--12位之间");
            return false;
        }

        if (isPassWord(newPwd, newPwd2) == 2){
            alert("新密码与确认新密码必须相同");
            return false;
        }

        $.ajax({
            type : "POST",  //提交方式
            url : "${APP_PATH }/json/User/updatePass",//路径
            data : $("#updatePassForm").serialize(), //数据，这里使用的是Json格式进行传输
            success : function(result) {//返回数据根据结果进行相应的处理
                if ( result.status == 200 ) {
                    alert("修改成功，请重新登录");
                    window.location.href="${APP_PATH }/Line/findByRecommend";
                } else {
                    alert("修改失败");
                }
            }
        });
    });
</script>
</body>
</html>