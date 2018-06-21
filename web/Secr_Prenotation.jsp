<%--
  Created by IntelliJ IDEA.
  User: mattia
  Date: 27/03/18
  Time: 15.15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Control.Controller" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="Bean.RoomBean" %>
<%@ page import="Utils.PrenotationBeanSingleton" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Si dichiara la variabile loginBean e istanzia un oggetto LoginBean -->
<jsp:useBean id="roomBean" class="Bean.RoomBean" scope="session"/>


<!-- Mappa automaticamente tutti gli attributi dell'oggetto loginBean e le proprietà JSP -->
<jsp:setProperty name="roomBean" property="*"/>




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
                            <h2>La prenotazione inserita va in conflitto con prenotazioni già inserite!</h2>
                            <br>
                            <form>
                                <div class="contact-right">
                                    <input class="login100-form-btn" type="submit" name="submit_delete" value="Cancella">
                                    <input class="login100-form-btn" type="submit" name="submit_not_delete" value="Non_cancellare">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <script>
                    // Get the modal
                    var modal = document.getElementById('myModal');

                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

                    // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    };

                    function showDiv() {
                        modal.style.display = "block";
                    }

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                </script>

                <%
                    String name = request.getParameter("aula");
                    boolean Response;
                    Controller controller = new Controller();

                    if (request.getParameter("submit_prenotation") != null){

                        roomBean.setNome(name);

                        String typePR;
                        LocalTime startPR;
                        LocalTime endPR;
                        String date;

                        if(request.getParameter("typePR") == null){

                            typePR = request.getParameter("altroPRtext");
                            String start = request.getParameter("startPR");
                            String end = request.getParameter("endPR");
                            date = request.getParameter("datePR");
                            if (start.isEmpty() || end.isEmpty() || typePR.isEmpty() || date.isEmpty()) {

                                String info = "alert('Completare tutti i campi!');";
                                out.println("<script type=\"text/javascript\">");
                                out.println(info);
                                out.println("location='Secr_Prenotation.jsp';");
                                out.println("</script>");
                            }

                            roomBean.setInizio(start);
                            roomBean.setFine(end);
                            roomBean.setDatapr(date);
                            roomBean.setTipopr(typePR);

                            startPR = LocalTime.parse(start);
                            endPR = LocalTime.parse(end);
                            Response = controller.newPrenotationSecretary(name, typePR, date, startPR, endPR);
                            System.out.println(typePR + " " + start + " " + end + " " + date);
                        }else{
                            typePR = request.getParameter("typePR");
                            String start = request.getParameter("startPR");
                            String end = request.getParameter("endPR");
                            date = request.getParameter("datePR");

                            if (start.isEmpty() || end.isEmpty() || typePR.isEmpty() || date.isEmpty()) {

                                String info = "alert('Completare tutti i campi!');";
                                out.println("<script type=\"text/javascript\">");
                                out.println(info);
                                out.println("location='Secr_Prenotation.jsp';");
                                out.println("</script>");
                            }

                            roomBean.setInizio(start);
                            roomBean.setFine(end);
                            roomBean.setDatapr(date);
                            roomBean.setTipopr(typePR);

                            startPR = LocalTime.parse(start);
                            endPR = LocalTime.parse(end);
                            Response = controller.newPrenotationSecretary(name, typePR, date, startPR, endPR);

                            System.out.println(typePR + " " + start + " " + end + " " + date);

                        }

                        if (Response) {

                            String info = "alert('Prenotazione Effettuata con successo');";
                            out.println("<script type=\"text/javascript\">");
                            out.println(info);
                            out.println("location='secretaryPage.jsp';");
                            out.println("</script>");
                            
                        }else {
                %>
                <script type="text/javascript">
                    showDiv();
                </script>
                <%
                        }
                    }

                    if(request.getParameter("submit_delete") != null){

                        Response = controller.deleteThenInsert(roomBean.getNome(), roomBean.getTipopr(), roomBean.getDatapr(),
                                LocalTime.parse(roomBean.getInizio()), LocalTime.parse(roomBean.getFine()));
                        System.out.println(Response);

                        if (Response){

                            String info = "alert('Prenotata " + name + "');";
                            out.println("<script type=\"text/javascript\">");
                            out.println(info);
                            out.println("location='secretaryPage.jsp';");
                            out.println("</script>");

                        }
                    }
                    if(request.getParameter("submit_not_delete") != null){

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Operazione annullata');");
                        out.println("location=secretaryPage.jsp';");
                        out.println("</script>");

                    }

                %>
                <span class="login100-form-title-1">
						University of Tor Vergata
					</span>
            </div>
            <div class="table100 ver1 m-b-110">
                <div class="table100-head">
                    <table>
                        <thead>
                        <tr class="row100 head">
                            <th class="cell100 column1">Nuova prenotazione per l' <%=request.getParameter("aula")%></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <form action="" method="post" class="login100-form validate-form">

            <div class="wrap-input100 validate-input m-b-18" data-validate ="Start">
                <span class="label-input100">Start</span>
                <input class="input100" type="text" name="startPR" placeholder="<%=PrenotationBeanSingleton.getInstance().getPrenotation_bean().getInizio()%>" disabled="disabled">
                <span class="focus-input100"></span>
            </div>


            <div class="wrap-input100 validate-input m-b-18" data-validate ="End">
                <span class="label-input100">End</span>
                <input class="input100" type="text" name="endPR" placeholder="<%=PrenotationBeanSingleton.getInstance().getPrenotation_bean().getFine()%>" disabled="disabled">
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input m-b-18" data-validate ="Date">
                <span class="label-input100">Date</span>
                <input class="input100" type="text" name="datePR" placeholder="<%=PrenotationBeanSingleton.getInstance().getPrenotation_bean().getDate()%>" disabled="disabled">
                <span class="focus-input100"></span>
            </div>
            <div class="wrap-input100 validate-input m-b-18">
                <fieldset>
                    <span class="label-input100">Esame</span>
                    <input style="margin-top: 15px" type="radio" name="typePR" value="Esame"/>
                </fieldset>
            </div>
            <div class="wrap-input100 validate-input m-b-18">
                <fieldset>
                    <span class="label-input100">Conferenza</span>
                    <input style="margin-top: 15px" type="radio" name="typePR" value="Conferenza"/>

                </fieldset>
            </div>
            <div class="wrap-input100 validate-input m-b-18" data-validate ="Altro">
                <span class="label-input100">Altro</span>
                <input class="input100" type="text" id="textInput" name="altroPRtext" placeholder="Altro">
                <span class="focus-input100"></span>
            </div>
            <div class="container-login100-form-btn">
                <div class="contact-right">
                    <input class="login100-form-btn" type="submit" name="submit_prenotation" value="Prenota">
                </div>
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


<%--QUANDO SI CLICCA SULLA TEXTFIELD ALTRO VENGONO DISATTIVATI I RADIO BUTTON--%>
<script>
    $('#textInput').click(function () {
        $('input[type=radio]').removeAttr("checked");

    });
</script>

</body>
</html>