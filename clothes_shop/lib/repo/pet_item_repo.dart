import 'dart:convert';

import 'package:clothes_shop/models/pet_item.dart';
import 'package:clothes_shop/utils/api.dart';
import 'package:http/http.dart' as http;

class PetitemsRepo {
  static Future<void> getPetItems({
    required Function(List<Doctors> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      //print(Uri.parse(Api.petItems));
      http.Response response = await http.get(
        Uri.parse(Api.petItems),
        headers: headers,
      );
      //print("API hited");
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //print("12213123213");

        List<Doctors> petItems = petITemsFromJson(data["data"]);
        onSuccess(petItems);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      // log(e.toString());
      onError("Sorry! something went wrong");
      print(e);
    }
  }
}
