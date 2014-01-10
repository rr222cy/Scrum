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
                <h1>Administrationsöversikten</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
                <section class="leftFloat">
                    <h2>Översikt</h2>
                    <p>Välj en aktivitet i listan till höger, nedan listas ett urval av de medlemmar som finns registrerade i
                    Medlemshanteraren 1.0.</p>
                </section>
                <section class="leftFloat">
                    <table class="registerList" width="650" border="1">
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
                                <td colspan="4"></td>
                            </tr>
                        </tfoot>
                        <tbody>
<%
strSQL="SELECT * FROM tblUsers order by rand() LIMIT 8"
Set objRS = Connect.Execute(strSQL)

If not objRS.EOF then
Do until objRS.EOF
%>
                            <tr>
                                <td rowspan="1" class="tableCenter"><a href="memberSpecs.asp?page=showSpecs&userID=<%=objRS("userID")%>"><%=objRS("userID")%></a></td>
                                <td><%=objRS("userFirstName")%></td>
                                <td><%=objRS("userLastName")%></td>
                                <td><%=objRS("userTelephone")%></td>
                                <td class="tableCenter">
                                    <a class="deleteLink" href="editMember.asp?page=runDeleteMember&userID=<%=objRS("userID")%>"><img src="pics/rubbish-bin.png" border="0" width="16" height="16" alt="Papperskorg" /></a>
                                    <a href="editMember.asp?page=editMember&userID=<%=objRS("userID")%>"><img src="pics/edit-file-icon.png" border="0" width="16" height="16" alt="Papper och penna" /></a>
                                </td>
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