import 'dart:convert';

// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class MoodleAPI {
  final String baseURL = 'https://moodle.unipampa.edu.br/moodle';

  Future<dynamic> login(String studentCode, String password) async {
    ConnectivityResult connectivityStatus =
        await (Connectivity().checkConnectivity());

    if (connectivityStatus != ConnectivityResult.none) {
      String endpoint = '/login/token.php';
      String query =
          '?username=$studentCode&password=$password&service=moodle_mobile_app';
      String requestURL = baseURL + endpoint + query;

      var response = await http.get(requestURL);
      print("moodleAPI/userData/response -> " + response.body);
      return jsonDecode(response.body);
    }   
  }

  Future<dynamic> userData(String token) async {
    ConnectivityResult connectivityStatus = await (Connectivity().checkConnectivity());

    if (connectivityStatus != ConnectivityResult.none) {
      String endpoint = '/webservice/rest/server.php';
      String query = '?wstoken=$token&moodlewsrestformat=json&wsfunction=core_webservice_get_site_info';
      String requestURL = baseURL + endpoint + query;

      var response = await http.get(requestURL);
      print("moodleAPI/userData/response -> " + response.body);
      return jsonDecode(response.body);
    }
  }
  
  Future<dynamic> userActivities(String token) async {
    ConnectivityResult connectivityStatus = await (Connectivity().checkConnectivity());

    if (connectivityStatus != ConnectivityResult.none) {
      String endpoint = '/webservice/rest/server.php';
      String query = '?wstoken=$token&moodlewsrestformat=json&wsfunction=core_calendar_get_calendar_upcoming_view';
      String requestURL = baseURL + endpoint + query;

      var response = await http.get(requestURL);
      print("moodleAPI/userActivities/response -> " + response.body);
      return jsonDecode(response.body);
    }
  }
}
