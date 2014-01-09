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
                <h1>Sök efter medlem</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
<% If Request.Querystring("page")="searchMember" Then %>
                <section class="leftFloat">
                    <h2>Sök medlem</h2>
                    <div class="standardFormDiv">
                        <form name="MemberSearchForm" action="searchMember.asp?page=runSearchMember" method="post">
                        <fieldset>
                            <legend>Skriv in personens förnamn och klicka på sök medlem.</legend>
                            <label class="leftalign" for="userID">Sökord:</label><br />
                                <input type="text" name="searchTerm" id="searchTerm" size="10" required><br />
                        </fieldset>                                                    
                        <input type="submit" name="Submit" id="Submit" value="Sök medlem">
                        </form>
                        <p><%=Session("felmess")%><% Session("FelMess")="" %></p>
                    </div>
                </section>
<% ElseIf Request.Querystring("page")="runSearchMember" Then %>
            <section class="leftFloat">
                    <h2>Sökresultat</h2>
                    <p>Dessa personer matchade din sökning.</p>
                    <p>&nbsp;</p>
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
                                <td colspan="4"></td>
                            </tr>
                        </tfoot>
                        <tbody>
<%
If Request.Form("searchTerm")="" Then
Session("FelMess")="<span class='red'>Skriv en sökterm!</span>"
Else
strSQL="SELECT * FROM tblUsers where userFirstName Like '%"& antiSqlInjection(Request.Form("searchTerm")) &"%'"
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
End If
objRS.Close : Set objRS = Nothing
%>
                        </tbody>
                    </table>
                <p><%=Session("felmess")%><% Session("FelMess")="" %></p>
                <p>&nbsp;</p>
                <p><a href="searchMember.asp?page=searchMember">Sök igen</a></p>
            </section>
<% End If %>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>

                            
