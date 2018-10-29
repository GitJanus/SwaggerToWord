<%-- text/html：正常的html显示  application/msword：html页面直接转word--%>
<%@ page contentType="application/msword" pageEncoding="UTF-8" language="java" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>tool</title>
        <style type="text/css">
            .bg {
            background-color: rgb(197,198,194);
            }

            tr {
            height: 20px;
            font-size: 18px;
            }

            .specialHeight {
            height: 40px;
            }
        </style>
    </head>
    <body>
        <div style="width:1800px; margin: 0 auto">
            <c:forEach items="${table}" var="t">
                <h3>${t.title}</h3> <%--这个是类的说明--%>
                <c:forEach items="${t.tableList}" var="temp">
                    <h4>${temp.tag}</h4>   <%--这个是每个请求的说明，方便生成文档后进行整理--%>
                    <table border="1" cellspacing="0" cellpadding="0" width="100%">
                        <tr class="bg">
                            <td colspan="5"><c:out value="${temp.tagNew}"/></td>
                        </tr>
                        <tr>
                            <td width="15%">URL</td>
                            <td colspan="4">${temp.url}</td>
                        </tr>
                        <tr>
                            <td width="15%">请求方式</td>
                            <td colspan="4">${temp.requestType}</td>
                        </tr>
                        <tr>
                            <td width="15%">请求类型</td>
                            <td colspan="4">${temp.requestForm}</td>
                        </tr>
                        <tr>
                            <td width="15%">返回类型</td>
                            <td colspan="4">${temp.responseForm}</td>
                        </tr>

                        <tr class="bg" align="center">
                            <td width="15%">参数名</td>
                            <td>数据类型</td>
                            <td width="15%">参数类型</td>
                            <td width="15%">是否必填</td>
                            <td width="25%">说明</td>
                        </tr>
                        <c:forEach items="${temp.requestList}" var="req">
                            <tr>
                                <td>${req.name}</td>
                                <td>${req.type}</td>
                                <td>${req.paramType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${req.require == true}">Y</c:when>
                                        <c:otherwise>N</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${req.remark}</td>
                            </tr>
                        </c:forEach>
                        <tr class="bg" align="center">
                            <td width="15%">状态码</td>
                            <td colspan="3">描述</td>
                            <td width="15%">说明</td>
                        </tr>

                        <c:forEach items="${temp.responseList}" var="res">
                            <tr>
                                <td width="15%">${res.name}</td>
                                <td colspan="3">${res.description}</td>
                                <td width="15%">${res.remark}</td>
                            </tr>
                        </c:forEach>

                        <tr class="bg">
                            <td colspan="5">示例</td>
                        </tr>
                        <tr class="specialHeight">
                            <td class="bg">请求参数</td>
                            <td colspan="4">${temp.requestParam}</td>
                        </tr>
                        <tr class="specialHeight">
                            <td class="bg">返回值</td>
                            <td colspan="4">${temp.responseParam}</td>
                        </tr>
                    </table>
                    <br>
                </c:forEach>
            </c:forEach>
        </div>
    </body>
</html>
