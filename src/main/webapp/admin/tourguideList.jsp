<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/bootstrap/css/bootstrap.min.css" />
    <title>旅游系统后台管理</title>
    <style type="text/css"></style>
</head>

<body>
<div class="bread-crumb">
    <ul class="breadcrumb">
        <li><span class="glyphicon glyphicon-home"></span><a href="#">Home</a></li>
        <li><a href="#">TourGuide</a></li>
        <li>list</li>
    </ul>
</div>
<div class="panle panel-info">
    <div class="panel-heading">
        <a class="panel-title">导游列表</a>
    </div>
    <div class="panel-body">
        <table class="table table-striped table-hover">
            <%--表头--%>
            <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>电话</th>
                <th>个人介绍</th>
                <th>导游类型</th>
                <th>导游状态</th>
                <th>审核情况</th>
                <th>注册日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <%--显示数据--%>
            <tbody>
            <c:forEach items="${pageInfo.pageList }" var="guide">
                <tr>
                    <td>${guide.id }</td>
                    <td>${guide.realName }</td>
                    <td>
                        <c:if test="${guide.sex  eq 0}">
                            男
                        </c:if>
                        <c:if test="${guide.sex eq 1}">
                            女
                        </c:if>
                    </td>
                    <td>${guide.age }</td>
                    <td>${guide.phone }</td>
                    <td>${guide.introduce }</td>
                    <td>
                        <c:if test="${guide.type eq 0}">
                            周边导游
                        </c:if>
                        <c:if test="${guide.type eq 1}">
                            国内导游
                        </c:if>
                        <c:if test="${guide.type eq 2}">
                            国际导游
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${guide.status eq 0}">
                            空闲
                        </c:if>
                        <c:if test="${guide.status eq 1}">
                            繁忙
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${guide.pass eq 0}">
                            未通过
                        </c:if>
                        <c:if test="${guide.pass eq 1}">
                            已通过
                        </c:if>
                    </td>
                    <td>${guide.created }</td>
                    <td>
                        <c:if test="${guide.pass eq 0}">
                            <a href="${APP_PATH}/TourGuide/updatePass?tourGuide.id=${guide.id }&tourGuide.pass=1"><input type="button" value="通过审核" class="btn btn-primary"/></a>
                        </c:if>
                        <c:if test="${guide.pass eq 1}">
                            <a href="${APP_PATH}/TourGuide/updatePass?tourGuide.id=${guide.id }&tourGuide.pass=0"><input type="button" value="重新审核" class="btn btn-info"/></a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <%--分页--%>
            <tfoot>
            <tr>
                <td colspan="8">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/TourGuide/all">首页</a></li>
                        <c:if test="${pageInfo.pageIndex > 1 }">
                            <li><a href="${APP_PATH}/TourGuide/all?page=${pageInfo.pageIndex - 1 }">«</a></li>
                        </c:if>

                        <%--计算开始和结束的页码--%>
                        <c:choose>
                            <%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
                            <c:when test="${pageInfo.totalPage <= 5}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${pageInfo.totalPage}"/>
                            </c:when>

                            <%-- 当总页数>5时，显示当前页前后的5页 --%>
                            <c:otherwise>
                                <%-- 当总页数>5时，通过公式计算出begin和end --%>
                                <c:set var="begin" value="${pageInfo.pageIndex - 2}"/>
                                <c:set var="end" value="${pageInfo.pageIndex + 2}"/>
                                <%-- 头溢出 --%>
                                <c:if test="${begin < 1}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="5"/>
                                </c:if>
                                <%-- 尾溢出 --%>
                                <c:if test="${end > pageInfo.totalPage}">
                                    <c:set var="begin" value="${pageInfo.totalPage - 4 }"/>
                                    <c:set var="end" value="${pageInfo.totalPage }"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                        <%-- 循环遍历页码列表 --%>
                        <c:forEach var="i" begin="${begin}" end="${end}">
                            <c:choose>
                                <c:when test="${i eq pageInfo.pageIndex }">
                                    <li class="active"><a href="${APP_PATH}/TourGuide/all?page=${i }">${i }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${APP_PATH}/TourGuide/all?page=${i }">${i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${pageInfo.pageIndex < pageInfo.totalPage }">
                            <li><a href="${APP_PATH}/TourGuide/all?page=${pageInfo.pageIndex + 1 }">»</a></li>
                        </c:if>
                        <li><a href="${APP_PATH}/TourGuide/all?page=${pageInfo.totalPage }">尾页</a></li>
                    </ul>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>

</body>
</html>