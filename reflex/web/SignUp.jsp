<%-- 
    Document   : SignUp
    Created on : Jan 1, 2018, 2:08:15 AM
    Author     : Shameera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <div id="id01" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-top">
                    <header class="w3-container w3-theme-l1"> 
                        <span onclick="document.getElementById('id01').style.display = 'none'"
                              class="w3-button w3-display-topright">×</span>
                        <center><h4>WELCOME</h4></center>
                    </header>

                    <form method="post" action="SignUp" class="w3-container w3-card-4 w3-light-grey w3-text-grey w3-margin">
                        <h2 class="w3-center">SIGN-UP</h2>
                        <div class="w3-row w3-section">
                            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
                            <div class="w3-rest">
                                <input class="w3-input w3-border" name="fullname" type="text" placeholder="Full Name" required>
                            </div>
                        </div>
                        <div class="w3-row w3-section">
                            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
                            <div class="w3-rest">
                                <input class="w3-input w3-border" name="telno" type="text" placeholder="Contact Number" required>
                            </div>
                        </div>
                        <div class="w3-row w3-section">
                            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-at"></i></div>
                            <div class="w3-rest">
                                <input class="w3-input w3-border" name="email" type="text" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="w3-row w3-section">
                            <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-asterisk"></i></div>
                            <div class="w3-rest">
                                <input class="w3-input w3-border" name="password" type="password" placeholder="Password" required>
                            </div>
                        </div>
                        <button class="w3-button w3-block w3-section w3-dark-grey w3-ripple w3-padding">Submit</button>
                    </form>      
                </div>
            </div>
    </head>

</html>
