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
strSQL="SELECT * FROM tblAdmin order by adminID"
Set objRS = Connect.Execute(strSQL)

If not objRS.EOF then
Do until objRS.EOF
%>
                            <tr>
                                <td rowspan="1" class="tableCenter"><a href="memberSpecs.asp?page=showSpecs&userID=<%=objRS("adminID")%>"><%=objRS("adminID")%></a></td>
                                <td><%=objRS("adminFirstName")%></td>
                                <td><%=objRS("adminLastName")%></td>
                                <td><%=objRS("adminTelephone")%></td>
                                <td class="tableCenter">
                                    <a class="deleteLink" href="editAdmin.asp?page=runDeleteMember&userID=<%=objRS("adminID")%>"><img src="pics/rubbish-bin.png" border="0" width="16" height="16" alt="Papperskorg" /></a>
                                    <a href="editAdmin.asp?page=editMember&userID=<%=objRS("adminID")%>"><img src="pics/edit-file-icon.png" border="0" width="16" height="16" alt="Papper och penna" /></a>
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
                    
                <section class="leftFloat">
                    <% If Request.QueryString("page")="newAdmin" Then %>
                    <h2>Lägg till administratör</h2>
                    <% If Request.QueryString("action")="adminAdded" Then %>
                    <p class="red">Medlemmen har nu lagts till i registret!</p>
                    <% End If %>
                    <div class="standardFormDiv">
                        <form name="MemberAddForm" action="editAdmin.asp?page=runAddAdmin" method="post">
                            <fieldset>
                                <legend>Lägg till medlem</legend>
                                <label class="leftalign" for="firstName">Förnamn:</label><br />
                                    <input type="text" name="firstName" id="firstName"  required><br />
                                <label class="leftalign" for="lastName">Efternamn:</label><br />
                                    <input type="text" name="lastName" id="lastName"  required><br />
                                <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                                    <input type="tel" name="telephone" id="telephone"  required><br />
                            </fieldset>                                                    
                            <input type="submit" name="Submit" id="Submit" value="Lägg till medlem">
                        </form>
                    </div>
                        
                    <% ElseIf Request.QueryString("page")="editMember" Then %>
                    <h2>Redigera administratör</h2>
<%
strSQL="SELECT * FROM tblUsers Where userID="& clng(Request.Querystring("userID")) &""
Set objRS = Connect.Execute(strSQL)
%>
                    <form name="MemberEditForm" action="editMember.asp?page=runUpdateMember&userID=<%=objRS("userID")%>" method="post">
                    <fieldset>
                        <legend>Redigera <%=objRS("userFirstName")%> <%=objRS("userLastName")%>:s uppgifter</legend>
                        <label class="leftalign" for="userID">MedlemsID:</label><br />
                            <input type="text" name="userID" id="userID" size="10" value="<%=objRS("userID")%>" disabled required><br />
                        <label class="leftalign" for="firstName">Förnamn:</label><br />
                            <input type="text" name="firstName" id="firstName" size="45" value="<%=objRS("userFirstName")%>" required><br />
                        <label class="leftalign" for="lastName">Efternamn:</label><br />
                            <input type="text" name="lastName" id="lastName" size="45" value="<%=objRS("userLastName")%>" required><br />
                        <label class="leftalign" for="telephone">Telefonnummer:</label><br />
                            <input type="tel" name="telephone" id="telephone" size="45" value="<%=objRS("userTelephone")%>" required><br />
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