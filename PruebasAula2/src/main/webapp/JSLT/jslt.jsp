<%-- 
    Document   : jstl
    Created on : 16-nov-2017, 20:33:33
    Author     : aitor
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="listaNom" scope="page" class="es.albarregas.beans.ListaNombres"/>
<jsp:useBean id="fechaHoy" scope="page" class="es.albarregas.beans.Fecha"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #azul{
            background-color: blue;
            color: white;
        }

        #verde{
            background-color: greenyellow;
            color: black;
        }
    </style>
    <body>
    <fmt:setLocale value ="es_ES"/>
    <c:set var="lista" scope="page" value="${listaNom.lista}"/>
    <c:set var="fechaActual" scope="page" value="${fechaHoy.fecha}"/>
    
    <!--Si me llega un parámetro llamado language y no está vacío lo guardo en la variable de sesión language, 
    si el parámetro está vacío busco en la variable language, si no está vacía la uso y si está vacía utilizo el locale de la petición.-->
    <c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="page" />
    <c:set var="semana" scope="page" value="Domingo-Lunes-Martes-Miercoles-Jueves-Viernes-Sabado"/>
    <c:set var="numero" value="12345.56789"/>
    <table>
        <tr>
            <td><h4>Lista de Nombres: </h4></td>
        </tr>
        <c:forEach var="listaFor" items="${lista}">
            <tr>
                <td>
                    <p><c:out value="${listaFor}"/></p>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <h4>Lista de Nombres con color:</h4>
            </td>
        </tr>
        
        <c:forEach var="listaFor" items="${lista}">
            <c:if var="pares" test="${(listaFro%2)==0}">
                <tr>
                    <td>
                        <p id="azul"><c:out value="${listaFor}"/></p>
                </td>
                </tr>
            </c:if>
            <c:if var="pares" test="${(listaFro%2)==0}">
                <tr>
                    <td>
                        <p id="verde"><c:out value="${listaFor}"/></p>
                </td>
                </tr>
            </c:if>
        </c:forEach>
        <tr>
            <td><h4>Semana</h4></td>
        </tr>
        <c:forTokens items="${semana}" delims="-" var="dia">
            <c:if var="domingoD" test="${dia=='Domingo'}">
                <tr>
                    <td>
                        <p><c:out value="${dia}"/>, el dia del señor</p>
                </td>
                </tr>
            </c:if>
            <c:if var="domingo" test="${dia!='Domingo'}">
                <tr>
                    <td>
                        <p><c:out value="${dia}"/></p>
                </td>
                </tr>
            </c:if>
        </c:forTokens>
        <tr>
            <td><h4>Formato de numeros: <c:out value="${numero}"/></h4></td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="currency"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="number" maxIntegerDigits="5"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="number" maxFractionDigits="3"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="number" groupingUsed="false"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="percent" maxIntegerDigits="5"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatNumber value="${numero}" type="percent" minIntegerDigits="10"/>
            </td>
        </tr>
        <tr>
           <td>
                <fmt:formatNumber value="${numero}" type="percent" maxFractionDigits="3"/>
            </td> 
        </tr>
        <tr>
            <td><h4>Formato de fecha: <c:out value="${fechaActual}"/></h4></td>
        </tr>
        <tr>
            <td>
                <fmt:formatDate value="${fechaActual}" type="time"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatDate value="${fechaActual}" type="date"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatDate value="${fechaActual}" type="both"/>
            </td>
        </tr>
        <tr>
            <td>
        <fmt:formatDate value="${fechaActual}" type="both" dateStyle="short" timeStyle="short"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatDate value="${fechaActual}" type="both" dateStyle="medium" timeStyle="medium"/>
            </td>
        </tr>
        <tr>
            <td>
                <fmt:formatDate value="${fechaActual}" type="both" dateStyle="long" timeStyle="long"/>
            </td>
        </tr>
        <tr>
            <td><p>Importar una pagina: </p></td>
        </tr>
        <tr>
            <td>
                <p><jsp:include page="otrojstl.jsp" flush="false"/></p>
                <p>Me llamo Aitor</p>
            </td>
        </tr>
        <tr>
            <td><a href="../index.html">Volver</a></td>
        </tr>
    </table>
    <form action="index.jsp" method="POST">
       <input type="submit" value="Volver a Menu" />
     </form><br />
     <h3>Internacionalización</h3>

     <fmt:message key="msg.greeting" /><br />
     <fmt:message key="msg.bye" /><br />
     <fmt:message key="label.require_field" />
     <br /><br />

     <form>
       <fmt:message key="label.select_language" />: 
       <select id="language" name="language" onchange="submit();">
          <option value="es_ES" 
            <c:if test="${language=='es_ES'}">selected</c:if>>
            <fmt:message key="label.spanish" />
          </option>
          <option value="en_US" 
            <c:if test="${language=='en_US'}">selected</c:if>>
            <fmt:message key="label.english" />
          </option>
       </select>
     </form>
     <br />

     <h3>formatNumber</h3>
     <c:set var="numero" value="125678.4309" />
     formatNumber (1)=> <fmt:message key="label.currency" />: 
     <%-- type= number, currency, percent --%>
     <fmt:formatNumber value="${numero}" type="currency"/><br />
</body>
</html>
