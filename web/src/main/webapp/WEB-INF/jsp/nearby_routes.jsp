<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tu" uri="/WEB-INF/tld/tu" %>
<%--
  Created by IntelliJ IDEA.
  User: victor
  Date: 17/10/15
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="routes" scope="request" type="java.util.List"/>
<c:if test="${not empty routes}">

    <h4 class="hidden-xs">Otras rutas cercanas a tu ubicaci&oacute;n</h4>
    <h5 class="visible-xs">Otras rutas cercanas a tu ubicaci&oacute;n</h5>

<table style="width:100%" class="table table-bordered table-striped">
    <tbody>
    <c:forEach items="${routes}" var="route">
        <jsp:useBean id="route" scope="page" type="com.trenurbanoapp.model.Route"/>
        <c:set var="darkColor" value="${tu:darken(route.color)}"/>
        <tr>
            <td>
                <div class="row">
                    <div class="col-xs-10" style="font-weight:bold">
                        Ruta
                        <span class="routeLabel" style="
                                background-color: ${route.color};
                                text-shadow: -1px 0 ${darkColor}, 0 1px ${darkColor}, 1px 0 ${darkColor}, 0 -1px ${darkColor};
                                border-color: ${darkColor}">${route.fullName}</span>
                    </div>
                    <div class="col-xs-2 text-right">
                        <div>
                            <a href="<c:url value="/app/map?route=${route.name}"/>" title="Ver en mapa">
                                <i class="fa fa-map-o"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</c:if>