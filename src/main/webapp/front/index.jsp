<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>index</title>
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

    <!-- 轮播图 -->
    <div class="comWidth">
        <div id="myFocus">
            <!--焦点图盒子-->
            <div class="loading">
                <img src="${APP_PATH}/front/images/loading1.gif"/>
            </div>
            <div class="pic">
                <!--图片列表-->
                <ul>
                    <c:set var="salaryCarouse" value="1" />
                    <c:forEach items="${lineList}" var="line">
                        <c:if test="${line.recommend == 2 and salaryCarouse <= 5 }">
                            <li>
                                <a href="${APP_PATH}/Line/findToDetail?id=${line.id }">
                                    <img src="${APP_PATH}${line.image}"/>
                                </a>
                            </li>
                            <c:set var="salaryCarouse" value="${salaryCarouse + 1}" />
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <%--推荐景点--%>
    <div class="midd comWidth">
        <h4> 推荐景点：</h4>
        <div class="midd_content">
            <div class="midd_content_top">
                <h3>国际游 :</h3>
                <ul class="midd_pict">
                    <c:set var="salary1" value="1" />
                    <c:forEach items="${lineList}" var="line">
                        <c:if test="${line.recommend == 1 and line.type == 2 and salary1 <= 3 }">
                            <li>
                                <a href="${APP_PATH}/Line/findToDetail?id=${line.id }">
                                    <img src="${APP_PATH}${line.image}"/>
                                    <p>${line.title }</p>
                                    <p><span><strong>￥${line.price}</strong>起</span></p>
                                </a>
                            </li>
                            <c:set var="salary1" value="${salary1 + 1}" />
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div class="midd_content_top">
                <h3>国内游 :</h3>
                <ul class="midd_pict">
                    <c:set var="salary2" value="1" />
                    <c:forEach items="${lineList}" var="line">
                        <c:if test="${line.recommend == 1 and line.type == 1 and salary2 <= 3 }">
                            <li>
                                <a href="${APP_PATH}/Line/findToDetail?id=${line.id }">
                                    <img src="${APP_PATH}${line.image}"/>
                                    <p>${line.title }</p>
                                    <p><span><strong>￥${line.price}</strong>起</span></p>
                                </a>
                            </li>
                            <c:set var="salary2" value="${salary2 + 1}" />
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div class="midd_content_top">
                <h3>周边游 :</h3>
               <ul class="midd_pict">
                   <c:set var="salary3" value="1" />
                   <c:forEach items="${lineList}" var="line" varStatus="status">
                       <c:if test="${line.recommend == 1 and line.type == 0 and salary3 <= 3 }">
                           <li>
                               <a href="${APP_PATH}/Line/findToDetail?id=${line.id }">
                                   <img src="${APP_PATH}${line.image}"/>
                                   <p>${line.title }</p>
                                   <p><span><strong>￥${line.price}</strong>起</span></p>
                               </a>
                           </li>
                           <c:set var="salary3" value="${salary3 + 1}" />
                       </c:if>
                   </c:forEach>
                </ul>
            </div> 
        </div>
    </div>

    <%--页尾--%>
    <jsp:include page="${APP_PATH}/front/footer.jsp"/>

    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <!--引入myFoucs的库文件及其对应的样式文件,使用jquery引入焦点图插件-->
    <script type="text/javascript" src="${APP_PATH}/front/js/myfocus-2.0.1.min.js"></script>
    <script type="text/javascript">
        // 1.选择h2元素，调用animate()方法
        //第1个参数是对象字面量：字间距变为.8em，做内边距变为.8em
        //第2个参数是动画持续1500毫
        $('h4').animate({
            letterSpacing: '.8em',
            paddingLeft: '.8em',
            fontSize: '1.5em'
        },1500);

        //设置
        myFocus.set({
            id: 'myFocus',//ID
            pattern: 'mF_taobao2010'//风格
        });
    </script>
</body>
</html>