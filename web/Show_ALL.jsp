<%--
  Created by IntelliJ IDEA.
  User: mattia
  Date: 27/03/18
  Time: 16.36
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: mattia
  Date: 23/03/18
  Time: 10.09
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Control.Controller" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="Entity.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Si dichiara la variabile loginBean e istanzia un oggetto LoginBean -->


<!-- Mappa automaticamente tutti gli attributi dell'oggetto loginBean e le proprietà JSP -->



<!DOCTYPE html>
<html lang="en">
<head>
    <title>Classroom's Handler</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="table/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="table/css/util.css">
    <link rel="stylesheet" type="text/css" href="table/css/main.css">
    <link rel="stylesheet" type="text/css" href="login/css/main.css">
    <link rel="stylesheet" type="text/css" href="login/css/popup.css">

    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-table100">
        <div class="wrap-table100">
            <div class="login100-form-title" style="background-image: url(login/images/bg-01.jpg);">
                <!-- The popup -->
                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content-login">
                        <span class="close">&times;</span>


                        <div class="login-right">
                            <h2>Prenotazione</h2>
                            <br>
                            <%-- <p><b>I'm already an ESHOP user</b><br>Enter your e-mail address and password to log into the website.</p>--%>
                            <form>
                                <div class="contact-right">
                                    <input class="login100-form-btn" type="submit"  name="submit_delete" value="Cancella">
                                </div>
                                <div class="contact-right">
                                    <input class="login100-form-btn" type="submit"  name="submit_not_delete" value="Non_cancellare">
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                <span class="login100-form-title-1">
						University of Tor Vergata
					</span>
            </div>
            <div class="table100 ver1 m-b-110">
                <div class="table100-head">
                    <table>
                        <thead>
                        <tr class="row100 head">
                            <th class="cell100 column2">Nome</th>
                            <th class="cell100 column2">Data</th>
                            <th class="cell100 column2">Inizio</th>
                            <th class="cell100 column2">Fine</th>
                            <th class="cell100 column2">Per</th>
                            <th class="cell100 column2">Da</th>
                            <th class="cell100 column2">ID</th>

                        </tr>
                        </thead>
                    </table>
                </div>

                <div class="table100-body js-pscroll" style="height:300px;overflow:auto;">
                    <table id="table" >
                        <tbody>

                        <%
                        Controller controller = new Controller();
                        ArrayList<Room> r = controller.allPrenotation();
                            for (int i = 0; i < r.size(); i++){%>

                        <tr><td><%=r.get(i).getNome()%></td><td><%=r.get(i).getDatapr()%></td><td><%=r.get(i).getInizio()%></td><td><%=r.get(i).getFine()%></td><td><%=r.get(i).getTipopr()%></td><td><%=r.get(i).getFromp()%></td><td><%=r.get(i).getID()%></td></tr>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <form action="" method="post" class="login100-form validate-form">

            <div class="wrap-input100 validate-input m-b-18" data-validate ="Data">
                <span class="label-input100">Data</span>
                <input class="input100" type="text" name="data" placeholder="Enter Room's data in format dd/MM/yyyy">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input m-b-18" data-validate ="Start">
                <span class="label-input100">Start</span>
                <input class="input100" type="text" name="start" placeholder="Enter Room's start hour">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input m-b-18" data-validate ="End">
                <span class="label-input100">End</span>
                <input class="input100" type="text" name="end" placeholder="Enter Room's end hour">
                <span class="focus-input100"></span>
            </div>
            <div class="container-login100-form-btn">
                <button class="login100-form-btn" type="submit"<%-- onclick="showBtn()"--%> name="submit_search" value="Search">
                    Search
                </button>
                <button class="login100-form-btn" type="submit" name="submit_show_prenotation" value="Show">
                    Mostra Prenotazioni
                </button>
                <button class="login100-form-btn" type="submit" name="submit_show_aule" value="Show">
                    Mostra Aule
                </button>
                <button class="login100-form-btn" type="submit" name="submit_show_aule_secr" value="Show">
                    Mostra Mie Prenotazioni
                </button>

            </div>

        </form>
    </div>
</div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

</body>
</html>