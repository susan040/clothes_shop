import 'dart:convert';
import 'dart:developer';
import 'package:clothes_shop/models/user.dart';
import 'package:clothes_shop/utils/api.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  static Future<void> login({
    required String email,
    required String password,
    required Function(User user, String token) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      log("message");
      var headers = {
        "Accept": "application/json",
      };
      var body = {"email": email, "password": password, "type": "customer"};
      log(body.toString());
      http.Response response = await http.post(Uri.parse(Api.loginUrl),
          headers: headers, body: body);
      dynamic data = jsonDecode(response.body);
      log(data.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        String accessToken = data["token"].toString();
        User user = User.fromJson(data["user"]);
        onSuccess(user, accessToken);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
