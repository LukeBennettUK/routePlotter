
// var routes = {};

// 			//var markerStart, markerFinish, polygon;
// 			//var markerStart;
// 			var markers = {};
// 			var polygon;
// 			var lastTripId;
// 			var specificJourneys = {};
// 			var mymap = L.map('mapid').setView([61.4977, 23.76136], 14);

// 			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
// 				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
// 				maxZoom: 18,
// 				id: 'mapbox.streets',
// 				accessToken: 'pk.eyJ1IjoibHVrZWJlbm5ldHR1ayIsImEiOiJjazBjeXVnZ3IwMmJrM2RyemhyOHVhMmFyIn0.Apvo0nJDVhnd9zyp2L2cgQ'
// 			}).addTo(mymap);

// 			var promise = $.get("http://data.itsfactory.fi/journeys/api/1/journeys");

// 			promise.then(
// 				data => requestSuccess(data),
// 				error => console.log('error: ', error)
// 			);

// 			function requestSuccess(data) {
// 				var journeys = data.body
// 				var countToTen = 0;

// 				function getSpecificJourneys() {
// 					for (var journey of journeys) {
// 						var headSignCount = 0;
// 						for (var headSign of Object.keys(specificJourneys)) {
// 							if (journey.headSign === headSign) {
// 								headSignCount++
// 							}
// 						}
// 						if (headSignCount === 0) {
// 							specificJourneys[journey.headSign] = journey;
// 							countToTen++
// 						} 

// 						if (countToTen === 10) {
// 							break;
// 						}
// 					}
// 				}

// 				function addRouteToggleButtons() {
// 					for (var journey in specificJourneys) {
// 						$('#routes').append('<p class="route-title">Start point: ' + specificJourneys[journey].headSign + ' | Days running: ' + specificJourneys[journey].dayTypes + '</p>');
// 						$('#routes').append('<button onclick="toggleRoute(\'' + specificJourneys[journey].gtfs.tripId + '\')">Toggle</button>');
// 					}
// 				}

// 				getSpecificJourneys();
// 				addRouteToggleButtons();
// 			}

// 			function addRoute(tripId) {
// 				for (var journey in specificJourneys) {
// 					if (specificJourneys[journey].gtfs.tripId === tripId) {

// 						var route = specificJourneys[journey].calls.map(function (call) {
// 							return call.stopPoint.location.split(',');
// 						});

// 						var markerCounter = 0;
// 						for (var call of specificJourneys[journey].calls) {
// 							markers['marker_' + markerCounter] = L.marker(call.stopPoint.location.split(',')).addTo(mymap);
// 							markers['marker_' + markerCounter].bindPopup(
// 								"<p>Arrival time: " + call.arrivalTime + "</p><p>Departure time: " + call.departureTime + "</p>"
// 							);

// 							markerCounter++;
// 						}

// 						polygon = L.polyline(route, {color: 'red'}).addTo(mymap);
// 					}
// 				}
// 			}

// 			function removeRoute() {
// 				for (var marker in markers) {
// 					markers[marker].remove();
// 				}

// 				markers = {};
// 				polygon.remove();
// 			}

// 			function toggleRoute(tripId) {
// 				if (!lastTripId) {
// 					addRoute(tripId);
// 					lastTripId = tripId;
// 				} else if (lastTripId !== tripId) {
// 					removeRoute();
// 					addRoute(tripId);
// 					lastTripId = tripId;
// 				} else {
// 					removeRoute();
// 					lastTripId = '';
// 				}
// 			}