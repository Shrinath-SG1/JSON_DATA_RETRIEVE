
  import 'dart:convert';

import 'package:json2/Services/jsonData.dart';
  import 'package:http/http.dart' as http;

final String apiURL = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Users>> fetchJSONData() async {
    var jsonResponse = await http.get(apiURL);

    if (jsonResponse.statusCode == 200) {
      final jsonItems = json.decode(jsonResponse.body).cast<
          Map<String, dynamic>>();

      List<Users> usersList = jsonItems.map<Users>((json) {
        return Users.fromJson(json);
      }).toList();

      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }