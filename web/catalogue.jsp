<%@page import="java.sql.Connection"%>
<%@page import="dao.DbConnection"%>
<html>
<head>
<title>Catalogue</title>
<LINK rel="stylesheet" type="text/css" href="Style.css">
<script type="text/javascript" src="ajax.js"></script>
</head>
<body class=standard>
    <h1  >Test catalogue</h1>
 <DIV class=Entete><P Class=titregros>Catalogue</P></DIV>
<%

//définir la connection
Connection con;
con=DbConnection.getInstance().getCo();
//execution d'une requete select pour rempli la combo
java.sql.PreparedStatement comm=con.prepareStatement("Select genre from Genre");
java.sql.ResultSet rs=comm.executeQuery();
%>
<TABLE border=0>
<TR>
<TD width=150px valign=top align=center>
<DIV ><P Class=titre>Choisir un genre :</P></DIV>
</TD>
<TD>
<!-- Sur l'événement onchange, on appelle la fonction ajax qui va rafraichir le catalogue -->
<select id="genre" onchange="rafraichirCatJsonAjax()" language="javascript" >
<%while (rs.next())
{%>
<option><%=rs.getString("genre")%></option>
<%}%>
</select>
</TD>
</TR>
</TABLE>
<HR>
<TABLE>
<TR>
<TD>
<!--Ici on définit l'emplacement du catalogue, tel qu'il sera généré à chaque modif du genre
on le remplira par innerHTML -->
<DIV id="cat">
</DIV>
</TD>
</TR>
</TABLE>
<%//fermer la connection
con.close(); %> 


</body>
</html>