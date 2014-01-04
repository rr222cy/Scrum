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
                <div style="clear: both;"></div>
            </main>
            
            <% Server.Execute("footer.asp") %>
        </div>
    </body>
</html>