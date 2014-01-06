<!-- #include file = "includes/dbConnectionString.asp" -->
<%
If Session("UserOnline")="" Then
Response.Redirect("index.asp")
End If
%>
<!DOCTYPE html>
<html>
<% Server.Execute("header.asp") %>
    <body>
        <div id="container">
            
            <header>
                <h1>Administration</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
                <section class="leftFloat">
                    <h2>Översikt</h2>
                    <p>Välj en aktivitet i listan till höger, nedan listas ett urval av de medlemmar som finns registrerade i
                    Medlemshanteraren 1.0.</p>
                </section>
                <section class="leftFloat">
                    <table width="650" border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Förnamn</th>
                                <th>Efternamn</th>
                                <th>Telefonnummer</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">Sida 1 av 10</td>
                            </tr>
                        </tfoot>
                        <tbody>
<%
strSQL="SELECT * FROM tblUsers order by rand() LIMIT 5"
Set objRS = Connect.Execute(strSQL)
%>
    <%
	If not objRS.EOF then
    Do until objRS.EOF
	%>
                            <tr>
                                <td rowspan="1"><%=objRS("userID")%></td>
                                <td><%=objRS("userFirstName")%></td>
                                <td><%=objRS("userLastName")%></td>
                                <td><%=objRS("userTelephone")%></td>
                            </tr>
              <%
    objRS.MoveNext
    Loop
    End If
objRS.Close : Set objRS = Nothing
    %>
                        </tbody>
                    </table>
                </section>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>