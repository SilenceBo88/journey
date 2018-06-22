<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>header</title>
</head>
<body>
    <div class="top">
        <div class="top_content comWidth">
            <c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
                <a href="#" data-toggle="modal" data-target="#login">登录</a>
                <a href="#" data-toggle="modal" data-target="#register">注册</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                用户：<a href="${APP_PATH}/User/myCenter?id=${sessionScope.user.id }">${sessionScope.user.userName }</a>
            </c:if>
        </div>
    </div>

    <!-- 注册模态框 -->
    <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="regModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="post" id="registerForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="regModalLabel">注册</h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal_large">
                            <table>
                                <form>
                                    <tr>
                                        <td width="80"><label>昵称:</label></td>
                                        <td><input type="text" name="user.userName" id="userName"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>密码:</label></td>
                                        <td><input type="password" name="user.passWord" id="passWord"/></td>
                                    </tr>
                                    <tr>
                                        <td width="80"><label>重复密码:</label></td>
                                        <td><input type="password" id="passWord2"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>真实姓名:</label></td>
                                        <td><input type="text" name="user.realName" id="realName"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>手机号码:</label></td>
                                        <td><input type="text" name="user.phone" id="phone"/></td>
                                    </tr>
                                    <tr>
                                        <td width="80"><label>年龄 ：</label></td>
                                        <td><input type="text" name="user.age" id="age"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>性别:</label></td>
                                        <td><input width="50" type="radio" name="user.sex" value="0" checked>男</label>
                                            <input type="radio" name="user.sex" value="1">女</td>
                                    </tr>
                                </form>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="regButton">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 登录模态框 -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" id="loginForm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="loginModalLabel">
                            欢迎登录
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="modal_large">
                            <table>
                                <form>
                                    <tr>
                                        <td width="80"><label>手机号:</label></td>
                                        <td><input type="text" name="user.phone"/></td>
                                    </tr>
                                    <tr>
                                        <td><label>密码:</label></td>
                                        <td><input type="password" name="user.passWord"/></td>
                                    </tr>
                                </form>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="loginButton">
                            登录
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div>
    </div><!-- /.modal -->
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript">

        /**
         * 登录
         */
        $("#loginButton").click(function(){
            $.ajax({
                type : "POST",  //提交方式
                url : "${APP_PATH }/json/User/login",//路径
                data : $("#loginForm").serialize(), //数据，这里使用的是Json格式进行传输
                success : function(result) {//返回数据根据结果进行相应的处理
                    if ( result.status == 200 ) {
                        alert("登录成功");
                        window.location.href = "${APP_PATH}/Line/findByRecommend";
                    } else if ( result.status == 500 ){
                        alert("用户名或密码错误");
                    }
                }
            });
        });

        /**
         * 注册
         */
        $("#regButton").click(function(){

            var userName = $("#userName").val();
            var passWord = $("#passWord").val();
            var passWord2 = $("#passWord2").val();
            var realName = $("#realName").val();
            var phone = $("#phone").val();
            var age = $("#age").val();

            if(!isUserName(userName)){
                alert("昵称必须在2--6位之间");
                return false;
            }

            if (isPassWord(passWord, passWord2) == 1){
                alert("密码必须在4--12位之间");
                return false;
            }

            if (isPassWord(passWord, passWord2) == 2){
                alert("密码与确认密码必须相同");
                return false;
            }

            if(!isRealName(realName)){
                alert("真实姓名必须在2--4位之间");
                return false;
            }

            if(!isPoneAvailable(phone)){
                alert("手机号格式不正确");
                return false;
            }

            if(!isAge(age)){
                alert("年龄必须是数字");
                return false;
            }

            $.ajax({
                type : "POST",  //提交方式
                url : "${APP_PATH }/json/User/register",//路径
                data : $("#registerForm").serialize(), //数据，这里使用的是Json格式进行传输
                success : function(result) {//返回数据根据结果进行相应的处理
                    if ( result.status == 300 ) {
                        alert("该手机号已经被注册!");
                    } else if ( result.status == 200 ) {
                        alert("注册成功");
                        $('#register').modal('hide');
                        $('#login').modal('show');
                    } else {
                        alert("注册失败");
                    }
                }
            });
        });

        //校验手机号
        function isPoneAvailable(str) {
            var myreg=/(\+86)?\s*1[345789]\d{9}/;
            if (myreg.test(str)) {
                return true;
            } else {
                return false;
            }
        }

        //校验密码
        function isPassWord(str, str2){
            if (str.length>12 || str.length<4 ){
                return 1;
            }else if (str != str2){
                return 2;
            }else {
                return 0;
            }
        }

        //校验昵称
        function isUserName(str){
            if (str.length>6 || str.length<2){
                return false;
            }else {
                return true;
            }
        }

        //校验真实姓名
        function isRealName(str){
            if (str.length>4 || str.length<2){
                return false;
            }else {
                return true;
            }
        }

        //校验年龄
        function isAge(str){
            if(!isNaN(str)){
                return true;
            }else{
                return false;
            }
        }

    </script>

</body>
</html>
