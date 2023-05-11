import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class AuthService {
  Future getAuth(Map formType) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    http.Response response = await http.post(url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(formType));

    inspect(response);
  }
}
