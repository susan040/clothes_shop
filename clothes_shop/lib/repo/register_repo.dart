import 'dart:convert';
import 'dart:developer';
import 'package:clothes_shop/utils/api.dart';
import 'package:clothes_shop/utils/http_request.dart';
import 'package:http/http.dart' as http;

class RegisterRepo {
  static Future<void> register({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required Function(String successMessage) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
      };
      var body = {
        "name": name,
        "phone": phoneNumber,
        "email": email,
        "password": password,
        "type": "customer",
      };
      http.Response response = await HttpRequest.post(
          Uri.parse(Api.registerUrl),
          headers: headers,
          body: body);
      dynamic data = jsonDecode(response.body);
      if (data["status"] == "success") {
        onSuccess(data["message"]);
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

