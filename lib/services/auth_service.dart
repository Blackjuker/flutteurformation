import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthService {
  Future<User> getAuth(Map formType) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    http.Response response = await http.post(url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(formType));

    //inspect(response);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      //  inspect(data);

      return User(
          id: data['id'], username: data['username'], email: data['email']);
    } else {
      throw Error();
    }
  }
}
