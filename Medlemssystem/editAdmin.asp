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
                <h1>Hantera administratörer</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
<% If Request.Querystring("page")="adminOverview" Then %>
                <section class="leftFloat">
                    <h2>Administratörsöversikt</h2>
                    <p>Nedan listas alla administratörer som finns i registret, du kan snabbt lägga till eller uppdatera en administratör.</p>
                </section>
                <section class="leftFloat">
                    <table width="650" border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Förnamn</th>
                                <th>Efternamn</th>
                                <th>Telefonnummer</th>
                                <th>E-post</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="5"></td>
                            </tr>
                        </tfoot>
                        <tbody>
<%
strSQL="SELECT * FROM tblAdmin order by adminID"
Set objRS = Connect.Execute(strSQL)

If not objRS.EOF then
Do until objRS.EOF
%>
                            <tr>
                                <td rowspan="1" class="tableCenter"><a href="adminSpecs.asp?page=showSpecs&userID=<%=objRS("adminID")%>"><%=objRS("adminID")%></a></td>
                                <td><%=objRS("adminFirstName")%></td>
                                <td><%=objRS("adminLastName")%></td>
                                <td><%=objRS("adminTelephone")%></td>
                                <td><a href="mailto:<%=objRS("adminEmail")%>"><%=objRS("adminEmail")%></a></td>
                                <td class="tableCenter">
                                    <a class="deleteLink" href="editAdmin.asp?page=runDeleteAdmin&adminID=<%=objRS("adminID")%>"><img src="pics/rubbish-bin.png" border="0" width="16" height="16" alt="Papperskorg" /></a>
                                    <a href="editAdmin.asp?page=editAdmin&adminID=<%=objRS("adminID")%>"><img src="pics/edit-file-icon.png" border="0" width="16" height="16" alt="Papper och penna" /></a>
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
<% ElseIf Request.QueryString("page")="newAdmin" Then %>
                <section class="leftFloat">
                    <h2>Lägg till administratör</h2>
                    <% If Request.QueryString("action")="adminAdded" Then %>
                    <p class="red">Administratören har nu lagts till i registret!</p>
                    <% End If %>
                    <div class="standardFormDiv">
                        <form name="AdminAddForm" action="editAdmin.asp?page=runAddAdmin" method="post">
                            <fieldset>
                                <legend>Lägg till administratör</legend>
                                <label class="leftalign" for="firstName">Förnamn:</label><br />
                                    <input type="text" name="firstName" id="firstName"  required><br />
                                <label class="leftalign" for="lastName">Efternamn:</label><br />
                                    <input type="text" name="lastName" id="lastName"  required><br />
                                <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                                    <input type="tel" name="telephone" id="telephone"  required><br />
                            </fieldset>                                                    
                            <input type="submit" name="Submit" id="Submit" value="Lägg till administratör">
                        </form>
                    </div>
                </section>        
<% ElseIf Request.QueryString("page")="editAdmin" Then %>
                <section class="leftFloat">
                    <h2>Redigera administratör</h2>
<%
strSQL="SELECT * FROM tblAdmin Where adminID="& clng(Request.Querystring("adminID")) &""
Set objRS = Connect.Execute(strSQL)
%>
                    <form name="AdminEditForm" action="editAdmin.asp?page=runUpdateAdmin&adminID=<%=objRS("adminID")%>" method="post">
                    <fieldset>
                        <legend>Redigera <%=objRS("adminFirstName")%> <%=objRS("adminLastName")%>:s uppgifter</legend>
                        <label class="leftalign" for="adminID">MedlemsID:</label><br />
                            <input type="text" name="adminID" id="adminID" size="10" value="<%=objRS("adminID")%>" disabled required><br />
                        <label class="leftalign" for="firstName">Förnamn:</label><br />
                            <input type="text" name="firstName" id="firstName" size="45" value="<%=objRS("adminFirstName")%>" required><br />
                        <label class="leftalign" for="lastName">Efternamn:</label><br />
                            <input type="text" name="lastName" id="lastName" size="45" value="<%=objRS("adminLastName")%>" required><br />
                        <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                            <input type="tel" name="telephone" id="telephone" size="45" value="<%=objRS("adminTelephone")%>" required>
                        <p>&nbsp;</p>
                        <label class="leftalign" for="email">E-post:</label><br />
                            <input type="email" name="email" id="email" size="45" value="<%=objRS("adminEmail")%>" required><br />
                        <label class="leftalign" for="password">Lösenord:</label><br />
                            <input type="password" name="password" id="password" size="45" value="<%=objRS("adminPassword")%>" required><br /> 
                    </fieldset>                                                    
                    <input type="submit" name="Submit" id="Submit" value="Uppdatera">
                    </form>
                    <p><%=Session("felmess")%></p>
                    <% Session("FelMess")="" %>
                    <% End If %>
                        
                </section>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>
<%   
' Kod för att uppdatera administratörsuppgifter
If Request.Querystring("page")="runUpdateAdmin" Then
strSQL="UPDATE tblAdmin SET adminFirstName='"& antiSqlInjection(Request.Form("firstName")) &"', adminLastName='"& antiSqlInjection(Request.Form("lastName")) &"', adminTelephone='"& antiSqlInjection(Request.Form("telephone")) &"', adminEmail='"& antiSqlInjection(Request.Form("email")) &"' Where adminID="& clng(Request.Querystring("adminID")) &""

Connect.Execute(strSQL)

' Stänger DB koppling
Connect.Close
Set Connect = Nothing

Session("FelMess")="<span class='red'>Administratören uppdaterades!</span>"
 
Refer = request.servervariables("http_referer")	   
Response.Redirect(Refer)
   
' Kod för att radera administratör ur registret
ElseIf Request.Querystring("page")="runDeleteAdmin" Then

strSQL="DELETE FROM tblAdmin Where adminID="& clng(Request.Querystring("adminID")) &""
Connect.Execute(strSQL)

' Stänger DB koppling
Connect.Close
Set Connect = Nothing 

Refer = request.servervariables("http_referer")	   
Response.Redirect(Refer)
End If
%>