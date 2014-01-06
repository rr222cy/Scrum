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
                <h1>Alla registrerade medlemmar</h1>
            </header>
            
            <main>
                <% Server.Execute("menu.asp") %>
                <section class="leftFloat">
                    <h2>Alla registrerade medlemmar</h2>
                    <p>Nedan listas alla registrerade medlemmar i fallande ordning utefter medlemmens ID-nummer.</p>
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
                            <tr>
                                <td rowspan="1">1</td>
                                <td>Robert</td>
                                <td>Roos</td>
                                <td>070-2546781</td>
                            </tr>
                            <tr>
                                <td rowspan="1">2</td>
                                <td>Eddard</td>
                                <td>Stark</td>
                                <td>070-5687412</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>