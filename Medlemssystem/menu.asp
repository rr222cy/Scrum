<nav>
                    <h3>Meny</h3>
                    <ul class="quickMenu">
                        <% If Request.QueryString("page")="overview" Then %>
                        <li>>> <a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="editAdmin.asp?page=editAdmin">Hantera administratörer</a></li>
                            
                        <% ElseIf Request.QueryString("page")="newMember" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li>>> <a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="editAdmin.asp?page=editAdmin">Hantera administratörer</a></li>
                            
                        <% ElseIf Request.QueryString("page")="allMembers" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li>>> <a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="editAdmin.asp?page=editAdmin">Hantera administratörer</a></li>
                            
                        <% ElseIf Request.QueryString("page")="editAdmin" Then %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li>>> <a href="editAdmin.asp?page=editAdmin">Hantera administratörer</a></li>
                            
                        <% Else %>
                        <li><a href="overview.asp?page=overview">Översikt</a></li>
                        <li><a href="editMember.asp?page=newMember">Lägg till medlem</a></li>
                        <li><a href="allMembers.asp?page=allMembers">Alla medlemmar</a></li>
                        <li><a href="editAdmin.asp?page=editAdmin">Hantera administratörer</a></li>
                            
                        <% End If %>
                        
                    </ul>
                </nav>