<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='resources/css/bootstrap.css'>
<link rel='stylesheet' href='resources/css/jquery-ui.css'>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<script type="text/javascript" src="resources/js/angular.min.js"></script>
<script src="resources/js/jquery-1.9.1.js"></script>
<script src="resources/js/jquery-ui-1.10.1.custom.js"></script>
<script src="resources/js/input-search.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' href='resources/css/form.css'>
<title>Gerenciamento de turmas</title>



</head>

<body ng-app="">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div ng-include="'resources/template/header.jsp'"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div ng-include="'resources/template/menu.jsp'"></div>
			</div>
			<script>
				$(document)
						.ready(
								function() {
									$('#table_lista_turmas')
											.DataTable(
													{
														"language" : {
															"url" : "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
														}
													});
								});
			</script>
			<script>
					
			</script>
			
			

			<div class="col-md-10">
			<h3>Turmas</h3>
				<c:if test="${not empty turmas }">
					<a href="novaTurma" class="btn btn-primary">Cadastrar nova
						turma</a>
				   </c:if>
				

				<c:if test="${ empty turmas}">
						Nenhuma turma cadastrada até o momento. 
				<a href="novaTurma"	class="btn btn-success btn-sm" role="button">Cadastrar turma</a>
				</c:if>
				<br/> <br/>
           		<message:messageLog/>

				<c:if test="${not empty turmas}">
					<table id="table_lista_turmas" class="lista-turmas table">
						<thead>
						<tr class="active">
							<th>Cod.</th>
							<th>Matriculados</th>
							<th>Curso</th>
							<th>Instrutor</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${turmas}" var="turma">
							<tr>
								<td>${turma.id}</td>
								<td>${turma.numeroDeAlunos}</td>
								<td>${turma.curso.nome}</td>
								<td>${turma.instrutor.nome}</td>
								<td><a href="mostraTurma?id=${turma.id}" class="btn btn-info btn-sm">Editar</a></td>
								<td><a href="pdf?id=${turma.id}" class="btn btn-info btn-sm" role="button" disabled>Relatório</a></td>
								<td><a href="removeTurma?id=${turma.id}" class="btn btn-danger btn-sm" role="button" onclick="return confirm('Deseja remover a turma ${turma.id}?');" >Remover</a></td>
								<td><a href="mostraTurma?id=${turma.id}" class="btn btn-info btn-sm">Editar</a></td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:if>
				<p>Google Calendar API Quickstart</p>

    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize_button" style="display: none;">Authorize</button>
    <button id="signout_button" style="display: none;">Sign Out</button>

    <pre id="content"></pre>

    <script type="text/javascript">
      // Client ID and API key from the Developer Console
      var CLIENT_ID = '580539165773-in7ijavls9b6co51qv882ah2sgfr0fbj.apps.googleusercontent.com';
      var API_KEY = 'AIzaSyCarR_TSu8exEq1d_PZ-qbagiTxh6CwbWE';

      // Array of API discovery doc URLs for APIs used by the quickstart
      var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

      // Authorization scopes required by the API; multiple scopes can be
      // included, separated by spaces.
      var SCOPES = "https://www.googleapis.com/auth/calendar.readonly";

      var authorizeButton = document.getElementById('authorize_button');
      var signoutButton = document.getElementById('signout_button');

      /**
       *  On load, called to load the auth2 library and API client library.
       */
      function handleClientLoad() {
        gapi.load('client:auth2', initClient);
      }

      /**
       *  Initializes the API client library and sets up sign-in state
       *  listeners.
       */
      function initClient() {
        gapi.client.init({
          apiKey: API_KEY,
          clientId: CLIENT_ID,
          discoveryDocs: DISCOVERY_DOCS,
          scope: SCOPES
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
          authorizeButton.onclick = handleAuthClick;
          signoutButton.onclick = handleSignoutClick;
        });
      }

      /**
       *  Called when the signed in status changes, to update the UI
       *  appropriately. After a sign-in, the API is called.
       */
      function updateSigninStatus(isSignedIn) {
        if (isSignedIn) {
          authorizeButton.style.display = 'none';
          signoutButton.style.display = 'block';
          listUpcomingEvents();
        } else {
          authorizeButton.style.display = 'block';
          signoutButton.style.display = 'none';
        }
      }

      /**
       *  Sign in the user upon button click.
       */
      function handleAuthClick(event) {
        gapi.auth2.getAuthInstance().signIn();
      }

      /**
       *  Sign out the user upon button click.
       */
      function handleSignoutClick(event) {
        gapi.auth2.getAuthInstance().signOut();
      }

      /**
       * Append a pre element to the body containing the given message
       * as its text node. Used to display the results of the API call.
       *
       * @param {string} message Text to be placed in pre element.
       */
      function appendPre(message) {
        var pre = document.getElementById('content');
        var textContent = document.createTextNode(message + '\n');
        pre.appendChild(textContent);
      }

      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      function listUpcomingEvents() {
        gapi.client.calendar.events.list({
          'calendarId': 'primary',
          'timeMin': (new Date()).toISOString(),
          'showDeleted': false,
          'singleEvents': true,
          'maxResults': 10,
          'orderBy': 'startTime'
        }).then(function(response) {
          var events = response.result.items;
          appendPre('Upcoming events:');

          if (events.length > 0) {
            for (i = 0; i < events.length; i++) {
              var event = events[i];
              var when = event.start.dateTime;
              if (!when) {
                when = event.start.date;
              }
              appendPre(event.summary + ' (' + when + ')')
            }
          } else {
            appendPre('No upcoming events found.');
          }
        });
      }

    </script>

    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    <script>
    var event = {
    		  'summary': 'Google I/O 2015',
    		  'location': '800 Howard St., San Francisco, CA 94103',
    		  'description': 'A chance to hear more about Google\'s developer products.',
    		  'start': {
    		    'dateTime': '2015-05-28T09:00:00-07:00',
    		    'timeZone': 'America/Los_Angeles'
    		  },
    		  'end': {
    		    'dateTime': '2015-05-28T17:00:00-07:00',
    		    'timeZone': 'America/Los_Angeles'
    		  },
    		  'recurrence': [
    		    'RRULE:FREQ=DAILY;COUNT=2'
    		  ],
    		  'attendees': [
    		    {'email': 'lpage@example.com'},
    		    {'email': 'sbrin@example.com'}
    		  ],
    		  'reminders': {
    		    'useDefault': false,
    		    'overrides': [
    		      {'method': 'email', 'minutes': 24 * 60},
    		      {'method': 'popup', 'minutes': 10}
    		    ]
    		  }
    		};

    		var request = gapi.client.calendar.events.insert({
    		  'calendarId': 'primary',
    		  'resource': event
    		});

    		request.execute(function(event) {
    		  appendPre('Event created: ' + event.htmlLink);
    		});
    </script>
			</div>
		</div>
	</div>
	    
	
</body>
</html>