<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DbConnection"%>
<%@page import="java.sql.Connection"%>
<!--Cette page repr�sente le 'petit bout' de page HTML (JSP) que l'on va rafra�chir suite � maj du genre -->
<%

//d�finir la connection
Connection con;
con=DbConnection.getInstance().ouvrir("mfcat1","visiteur","visiteur");
//ex�cution d'une requ�te select pour rempli la combo
//cette requ�te est param�tr�e et r�cup�re le param�tre pass� en m�thode POST
PreparedStatement comm=con.prepareStatement("Select reference, titre, auteur,photo, prix from Articles where genre='"+request.getParameter("genre")+"'");
java.sql.ResultSet rs=comm.executeQuery();
%>
<TABLE border=1>
<TR>
<TD>reference</TD><TD>titre</TD><TD>auteur</TD>
<TD>photo</TD><TD>prix</TD>
</TR>
<%
while (rs.next())
{%>
<TR>
<TD><A HREF="#" ><%=rs.getString("reference")%></A></TD>
<TD><%=rs.getString("titre")%></TD>
<TD><%=rs.getString("auteur")%></TD>
<TD><IMG SRC="<%=rs.getString("photo")%>"></TD>
<TD><%=rs.getFloat("prix")%></TD>
</TR>
<%}
%>
</TABLE>
<%//fermer la connection
con.close(); %>
