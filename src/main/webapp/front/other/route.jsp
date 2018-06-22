<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>route</title>
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
                    <li class="xl">线路</li>
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
        <div class="main">
            <div class="main_top">
                <ul>
                    <li aid="1" class="routeList">全部
                        <a href="#">More&gt;&gt;</a>
                    </li>
                    <li aid="2">国际游
                        <a href="#">More&gt;&gt;</a>
                    </li>
                    <li aid="3">国内游
                        <a href="#">More&gt;&gt;</a>
                    </li>
                    <li aid="4">周边游
                        <a href="#">More&gt;&gt;</a>
                    </li>
                </ul>
            </div>
            <div class="main_bottom"> 
                <h4>推荐景点 ：</h4>
                <div class="main_bottom_content" id="jump1">
                    <ul>
                        <c:forEach items="${lineList }" var="line">
                            <a href="javascript:;">
                                <li>
                                    <img class="shadow" src="${APP_PATH}${line.image}">
                                    <h4>${line.title}</h4>
                                    <p>
                                        <span><strong>${line.price}</strong>起</span>
                                        <a href="${APP_PATH}/Line/findToDetail?id=${line.id }"><button>立即预定</button></a>
                                    </p>
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </div>
                <div class="main_bottom_content hide" id="jump2">
                    <ul>
                        <c:forEach items="${lineList }" var="line">
                            <c:if test="${line.type == 2 }">
                                <a href="javascript:;">
                                    <li>
                                        <img class="shadow" src="${APP_PATH}${line.image}">
                                        <h4>${line.title}</h4>
                                        <p>
                                            <span><strong>${line.price}</strong>起</span>
                                            <a href="${APP_PATH}/Line/findToDetail?id=${line.id }"><button>立即预定</button></a>
                                        </p>
                                    </li>
                                </a>
                            </c:if>
                        </c:forEach>
                    </ul>      
                </div>
                <div class="main_bottom_content hide" id="jump3">
                    <ul>
                        <c:forEach items="${lineList }" var="line">
                            <c:if test="${line.type == 1 }">
                                <a href="javascript:;">
                                    <li>
                                        <img class="shadow" src="${APP_PATH}${line.image}">
                                        <h4>${line.title}</h4>
                                        <p>
                                            <span><strong>${line.price}</strong>起</span>
                                            <a href="${APP_PATH}/Line/findToDetail?id=${line.id }"><button>立即预定</button></a>
                                        </p>
                                    </li>
                                </a>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <div class="main_bottom_content hide" id="jump4">
                    <ul>
                        <c:forEach items="${lineList }" var="line">
                            <c:if test="${line.type == 0 }">
                                <a href="javascript:;">
                                    <li>
                                        <img class="shadow" src="${APP_PATH}${line.image}">
                                        <h4>${line.title}</h4>
                                        <p>
                                            <span><strong>${line.price}</strong>起</span>
                                            <a href="${APP_PATH}/Line/findToDetail?id=${line.id }"><button>立即预定</button></a>
                                        </p>
                                    </li>
                                </a>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%--页尾--%>
    <jsp:include page="${APP_PATH}/front/footer.jsp"/>

    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/front/js/jump.js"></script>
</body>
</html>