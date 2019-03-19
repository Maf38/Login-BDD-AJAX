<%-- 
    Document   : Identifier.jsp
    Created on : 14 mars 2019, 10:36:35
    Author     : gai
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Identifiez vous</title>
        <link href="CSSFormulaire.css" rel="stylesheet" type="text/css"/>
        <script src="ajax.js" type="text/javascript"></script>
    </head>
    <body>
      
            <DIV class=Entete><h1>Identifiez-vous</h1></DIV>
            <TABLE border=0 >
            <TR><TD Class=titre>Email</TD>
            <TD><INPUT Type="text" id="identifiant" /></TD>
            </TR>
            <TR><TD Class=titre>Mot de passe</TD>
            <TD><INPUT Type="text" id="pswd" /><Span id="erreurpssw" class="erreur" /></TD>
            </TR>
            </TABLE>
            <DIV class=centre><BR><INPUT Type="button" value="Valider" onclick="controleIdentAjax();"
            language="javascript"/></DIV>
            <div id="erreuremail" class="erreur" />

    </body>
</html>
