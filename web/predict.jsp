
<%--
  Created by IntelliJ IDEA.
  User: sarasumit
  Date: 8/28/2016
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="org.jsoup.nodes.Element" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Premier League Game Result Prediction</title>
  <meta name="viewport" content="width=device-width" />
  <link rel='stylesheet' media='screen and (min-width: 701px) and (max-width: 900px)'/>
  <link rel="icon" type="image/png" href="images/favicon.png" />
  <link rel="shortcut icon" href="favicon.ico">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/drop.css">
  <link rel="stylesheet" href="css/mainStyle.css">
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/drop.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      var homeTeam = ["Select","Accrington Stanley", "AFC Bournemouth", "AFC Telford United", "AFC Wimbledon", "Aldershot Town", "Altrincham", "Arsenal", "Aston Villa", "Barnet", "Barnsley", "Barrow", "Basingstoke Town", "Bath City", "Berwick Rangers", "Birmingham City", "Blackburn Rovers", "Blackpool", "Bolton Wanderers", "Boreham Wood", "Boston United", "Bradford City", "Braintree Town", "Brentford", "Brighton & Hove Albion", "Bristol City", "Bristol Rovers", "Bromley", "Burnley", "Burton Albion", "Bury", "Cambridge United", "Cardiff City", "Carlisle United", "Charlton Athletic", "Chelsea", "Cheltenham Town", "Chester", "Chesterfield", "Colchester United", "Coventry City", "Crawley Town", "Crewe Alexandra", "Crystal Palace", "Dagenham & Redbridge", "Derby County", "Doncaster Rovers", "Doncaster Rovers Belles", "Dover Athletic", "Eastleigh", "Ebbsfleet United", "Everton", "Exeter City", "Farnborough", "Fleetwood Town", "Forest Green Rovers", "Fulham", "Gateshead", "Gillingham", "Grimsby Town", "Guiseley", "Halifax Town", "Hartlepool United", "Havant & Waterlooville", "Hereford FC", "Huddersfield Town", "Hull City", "Ipswich Town", "Kidderminster Harriers", "Kingstonian", "Leeds United", "Leicester City", "Leyton Orient", "Lincoln City", "Liverpool", "London Bees", "Luton Town", "Macclesfield Town", "Manchester City", "Manchester United", "Mansfield Town", "Middlesbrough", "Millwall", "Millwall Lionesses", "Milton Keynes Dons", "Morecambe", "Newcastle United", "Newport County", "Northampton Town", "Norwich City", "Nottingham Forest", "Notts County", "Oldham Athletic", "Oxford United", "Peterborough United", "Plymouth Argyle", "Port Vale", "Portsmouth", "Preston North End", "Queens Park Rangers", "Reading", "Rochdale", "Rotherham United", "Scunthorpe United", "Sheffield United", "Sheffield Wednesday", "Shrewsbury Town", "Southampton", "Southend United", "Southport", "Stalybridge Celtic", "Stevenage", "Stockport County", "Stoke City", "Sunderland", "Sutton United", "Swansea City", "Swindon Town", "The New Saints", "Torquay United", "Tottenham Hotspur", "Tranmere Rovers", "Walsall", "Watford", "Welling United", "West Bromwich Albion", "West Ham United", "Widnes", "Wigan Athletic", "Woking", "Wolverhampton Wanderers", "Worcester City", "Wrexham", "Wycombe Wanderers", "Yeovil Town", "York City"
      ];
      $("#homeTeam").select2({
        data: homeTeam
      });
    });
  </script>
  <script type="text/javascript">
    $(document).ready(function() {
      var awayTeam = ["Select","Accrington Stanley", "AFC Bournemouth", "AFC Telford United", "AFC Wimbledon", "Aldershot Town", "Altrincham", "Arsenal", "Aston Villa", "Barnet", "Barnsley", "Barrow", "Basingstoke Town", "Bath City", "Berwick Rangers", "Birmingham City", "Blackburn Rovers", "Blackpool", "Bolton Wanderers", "Boreham Wood", "Boston United", "Bradford City", "Braintree Town", "Brentford", "Brighton & Hove Albion", "Bristol City", "Bristol Rovers", "Bromley", "Burnley", "Burton Albion", "Bury", "Cambridge United", "Cardiff City", "Carlisle United", "Charlton Athletic", "Chelsea", "Cheltenham Town", "Chester", "Chesterfield", "Colchester United", "Coventry City", "Crawley Town", "Crewe Alexandra", "Crystal Palace", "Dagenham & Redbridge", "Derby County", "Doncaster Rovers", "Doncaster Rovers Belles", "Dover Athletic", "Eastleigh", "Ebbsfleet United", "Everton", "Exeter City", "Farnborough", "Fleetwood Town", "Forest Green Rovers", "Fulham", "Gateshead", "Gillingham", "Grimsby Town", "Guiseley", "Halifax Town", "Hartlepool United", "Havant & Waterlooville", "Hereford FC", "Huddersfield Town", "Hull City", "Ipswich Town", "Kidderminster Harriers", "Kingstonian", "Leeds United", "Leicester City", "Leyton Orient", "Lincoln City", "Liverpool", "London Bees", "Luton Town", "Macclesfield Town", "Manchester City", "Manchester United", "Mansfield Town", "Middlesbrough", "Millwall", "Millwall Lionesses", "Milton Keynes Dons", "Morecambe", "Newcastle United", "Newport County", "Northampton Town", "Norwich City", "Nottingham Forest", "Notts County", "Oldham Athletic", "Oxford United", "Peterborough United", "Plymouth Argyle", "Port Vale", "Portsmouth", "Preston North End", "Queens Park Rangers", "Reading", "Rochdale", "Rotherham United", "Scunthorpe United", "Sheffield United", "Sheffield Wednesday", "Shrewsbury Town", "Southampton", "Southend United", "Southport", "Stalybridge Celtic", "Stevenage", "Stockport County", "Stoke City", "Sunderland", "Sutton United", "Swansea City", "Swindon Town", "The New Saints", "Torquay United", "Tottenham Hotspur", "Tranmere Rovers", "Walsall", "Watford", "Welling United", "West Bromwich Albion", "West Ham United", "Widnes", "Wigan Athletic", "Woking", "Wolverhampton Wanderers", "Worcester City", "Wrexham", "Wycombe Wanderers", "Yeovil Town", "York City"
      ];
      $("#awayTeam").select2({
        data: awayTeam
      });
    });
  </script>
  <script>
    $(document).ready(function () {
      if("<% out.print( request.getAttribute("result") ); %>" == "null"){
        $('#defaultModal').modal('show');
      }
      else{
        $('#myModal').modal('show');
      }
      $('#predict').click(function() {
        $.blockUI({
          message: 'Loading Please Wait...',
          css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: '.5',
            color: '#fff',
            fontSize: '18px',
            fontFamily: 'Verdana,Arial',
            fontWeight: '200'
          } });

        setTimeout($.unblockUI, 2000);
        if(validateTeam()) {
          return true;
        }
        return false;
      });

    });
  </script>
  <script>
    var ALERT_TITLE = "Premier League Game Result Prediction";
    var ALERT_BUTTON_TEXT = "OK! Let Me Try Again";

    if(document.getElementById) {
      window.alert = function(txt) {
        createCustomAlert(txt);
      }
    }

    function createCustomAlert(txt) {
      d = document;

      if(d.getElementById("modalContainer")) return;

      mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
      mObj.id = "modalContainer";
      mObj.style.height = d.documentElement.scrollHeight + "px";

      alertObj = mObj.appendChild(d.createElement("div"));
      alertObj.id = "alertBox";
      if(d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
      alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth)/2 + "px";
      alertObj.style.visiblity="visible";

      h1 = alertObj.appendChild(d.createElement("h1"));
      h1.appendChild(d.createTextNode(ALERT_TITLE));

      msg = alertObj.appendChild(d.createElement("p"));
      //msg.appendChild(d.createTextNode(txt));
      msg.innerHTML = txt;

      btn = alertObj.appendChild(d.createElement("a"));
      btn.id = "closeBtn";
      btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
      btn.href = "#";
      btn.focus();
      btn.onclick = function() { removeCustomAlert();return false; }

      alertObj.style.display = "block";

    }

    function removeCustomAlert() {
      document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
    }
    </script>
    <style>

      </style>
</head>

<body style="background-image:url('http://img.wallpaperfolder.com/f/44D34A2C510C/premier-league.jpg') ">
<script src="js/blockUI.js"></script>

<div class="container">
  <%
    Document doc = Jsoup.connect("https://www.premierleague.com/").get();
  %>
  <div class="row no-pad no-margin">
    <div class="col-md-4">
      <%
        Element leagueTable = doc.select("div.tablesContainer").first();
        out.println(leagueTable);
      %>
    </div>
    <div class="col-md-5">
      <div class="predictForm">
        <h2 class="text-center text-info" style="text-align: center"> Premier League Game Result <br><span class="text-success text-center">Prediction</span> </h2>
        <%
          Element dateAndFixtures = doc.select("div.fixturesAbridgedHeader ").first();
          out.println(dateAndFixtures);
        %>
        <form action="predict" method="post">
          <div class="col-md-4">
            <h4 class="text-center"> Home Team </h4>
            <select id="homeTeam" name="homeTeam" style="width: auto !important;">    </select>
          </div>
          <div class="col-md-2"></div>
          <div class="col-md-4">
            <h4 class="text-center"> Away Team </h4>
            <select name="awayTeam" id="awayTeam" style="width: auto !important;"></select>
          </div>
          <br><br><br>
          <div class="predictionButton"> </br></br>
            <input type="submit" class="clickButton center-block" id = "predict" value="See the Prediction">
          </div>
        </form>
      </div>
      <br>
      <div class="topStats">
        <h2 class="text-center" style="text-decoration: underline;color:#fff;"> <strong>Number of Titles Won </strong> </h2>
        <p class="text-center">Manchester United - 13</p>
        <p class="text-center">Chelsea - 4</p>
        <p class="text-center">Arsenal - 3</p>
        <p class="text-center">Manchester City - 2</p>
        <p class="text-center">Blackburn - 1</p>
        <p class="text-center">Leicester City - 1</p>
      </div>
    </div>
    <div class="col-md-3">
      <%
        Element nextFixtures = doc.select("div.embeddableMatchSummary ").first();
        Element dateAndFixturess = doc.select("div.fixturesAbridgedHeader ").first();
        out.println(dateAndFixturess);
        out.println(nextFixtures);
      %>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <div class="col-md-8">
            <h3 class="modal-title text-success pull-right">Result of Prediction</h3>
          </div>
          <div class="col-md-4 no-pad">
            <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
          </div>
        </div>
        <div class="modal-body" style="background-color: whitesmoke">
          <h3 id="home">  </h3>
          <h1 id="homeWinner" class="text-success text-center"> ${result == 1? "Home Team Wins" : ""} </h1>
          <h1 id="result" class="text-success text-center"> ${result == 2? "Draw" : ""} </h1>
          <h1 id="away">  </h1>
          <h1 id="awayWinner" class="text-success text-center"> ${result == 3? "Away Team Wins" : ""} </h1>
        </div>
        <div class="modal-footer" style="background-color: whitesmoke">
          <div class="col-md-2"></div>
          <div class="col-md-4">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#theta1Modal">View Adjusted Weight 1</button>
          </div>
          <div class="col-md-4">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#theta2Modal">View Adjusted Weight 2</button>
          </div>
          <div class="col-md-2"></div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="defaultModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <div class="col-md-8">
            <h2 class="modal-title text-success pull-right">Welcome!!!</h2>
          </div>
          <div class="col-md-4 no-pad">
            <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
          </div>
        </div>
        <div class="modal-body" style="background-color: whitesmoke">
        <h3> Welcome to Premier League Game Result Prediction. This application helps to predict the game result as win, lose or draw. <br><br><br>
          Please Choose<strong> Home Team</strong> and <strong>Away Team</strong> to see the result.
        </h3>
          <br><br>
          <%
            Element latestNews = doc.select("a.heroThumb").first();
            out.println(latestNews);
          %>

        </div>
      </div>
    </div>
  </div>

  <!-- Theta Values -->
  <div class="modal fade" id="theta1Modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <div class="col-md-8">
            <h3 class="modal-title text-success pull-right">Adjusted Weight 1</h3>
          </div>
          <div class="col-md-4 no-pad">
            <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
            <%--<button type="button" class="btn btn-danger pull-right" data-dismiss="modal">Close</button>--%>
          </div>
        </div>
        <div class="modal-body" style="background-color: whitesmoke">
          <%
            double [][] theta1Value  = (double[][]) request.getAttribute("theta1");
            String result="";
            if(theta1Value != null){
              for(int i=0;i<10;i++) {
                for (int j = 0; j < 3; j++) {
                  result= String.valueOf(theta1Value[i][j]);
                  out.println(result);
                }
              }
            }
          %>
        </div>
      </div>
    </div>
  </div>
  <!-- Theta Values -->

  <!-- Theta 2 Values -->
  <div class="modal fade" id="theta2Modal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <div class="col-md-8">
            <h3 class="modal-title text-success pull-right">Adjusted Weight 2</h3>
          </div>
          <div class="col-md-4 no-pad">
            <%--<button type="button" class="btn btn-danger pull-right" data-dismiss="modal">Close</button>--%>
              <button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
          </div>
        </div>
        <div class="modal-body style="background-color: whitesmoke"">
          <%
            double [][] theta2Value  = (double[][]) request.getAttribute("theta2");
            String resultTheta2="";
            if(theta2Value != null){
              for(int i=0;i<3;i++) {
                for (int j = 0; j < 11; j++) {
                  resultTheta2= String.valueOf(theta2Value[i][j]);
                  out.println(resultTheta2);
                }
              }
            }
          %>
        </div>
      </div>
    </div>
  </div>
  <!-- Theta 2 Values -->
</div>



<script>
  function validateTeam(){
    var home = document.getElementById("homeTeam").value;
    var away = document.getElementById("awayTeam").value;
    if(home == "Select" || away =="Select"){
      alert ("Please Select Team First");
      return false;
    }
    if(home == away){
      alert("Both Teams are Same");
      return false;
    }
    return true;
  }
</script>
</body>
</html>