<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/bootstrap/css/bootstrap.min.css" />
    <style type="text/css">
        /* 登录表单 */
        .sSign_form {
            width: 420px;
            margin: 0 auto;
            background: #eee;
            padding: 20px;
            margin-top: 10%;
        }

        .sSign_form>h3 {
            margin: 20px 0 20px 35%;
        }

        .sSign_form p {
            height: 50px;
            line-height: 50px;
        }

        .sSign_form p>input {
            margin-left: 60px;
            margin-top: -45px;
            width: 270px;
        }

        .sSign_form p>label {
            font-size: 16px;
        }

        .sSign_form #sSign_btn {
            width: 220px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin-left: 21%;
            margin-top: 5px;
        }
    </style>
</head>

<body style="background:#f8f3f3;">
    <div class="sSign">
        <div class="sSign_form">
            <h3>管理员登录</h3>
            <form class="form" id="adminForm">
                <p>
                    <label>用户名:</label> <input type="text" class="form-control" name="admin.uname" placeholder="用户名" id="uname" />
                </p>
                <p>
                    <label>密 码:</label> <input type="password" name="admin.pwd" class="form-control" placeholder="密码" id="pwd" />
                </p>
                <button type="button" class="btn btn-info" id="sSign_btn">登录</button>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript">
        $("#sSign_btn").click(function() {
            if ($("#uname").val() == "" || $("#pwd").val() == "") {
                alert("用户名或密码不能为空");
                return false;
            }
            $.ajax({
                url : "${APP_PATH }/json/Admin/login",
                type : "POST",
                data : $("#adminForm").serialize(),
                success : function(data) {
                    console.log(data);
                    if (data.status == 200) {
                        alert("登录成功");
                        window.location.href = "${APP_PATH}/admin/index.jsp";
                    } else {
                        alert(data.message);
                    }
                }
            });
        });
    </script>
</body>
</html>
