import 'dart:convert';

import '../models/model.dart';
import 'package:http/http.dart';

class HttpService {
  Future<List<User>?> getUsers() async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await get(uri);

    if (response.statusCode == 200) {
      List<dynamic> listOfJsons = jsonDecode(response.body);
      List<User> body = listOfJsons.map((e) => User.fromJson(e)).toList();
      return body;
    } else {
      throw ('Cant get data');
    }
  }
}
