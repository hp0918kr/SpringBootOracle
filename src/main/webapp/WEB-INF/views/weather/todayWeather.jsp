<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.dto.WeatherDTO" %>
<%
    List<WeatherDTO> rList = (List<WeatherDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현재 날씨</title>
    <link rel="stylesheet" href="/css/table.css"/>
</head>
<body>
<h2>현재 온도는?</h2>
<hr/>
<br/>
<div class="divTable minimalistBlack">
    <div class="divTableHeading">
        <div class="divTableRow">
            <div class="divTableHead">온도</div>
        </div>
    </div>
    <div class="divTableBody">
        <%
            for (WeatherDTO rDTO : rList) {
        %>
        <div class="divTableCell"><%=CmmUtil.nvl(rDTO.getTemperature())%>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>