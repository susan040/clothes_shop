import 'dart:convert';
import 'package:clothes_shop/models/appointment.dart';
import 'package:clothes_shop/utils/api.dart';
import 'package:clothes_shop/utils/storage_keys.dart';
import 'package:http/http.dart' as http;

class AppointmentRepo {
  static Future<void> getAppointments({
    required Function(List<AppointmentDetails> category) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var token = StorageHelper.getToken();
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

      //print(Uri.parse(Api.petItems));
      http.Response response = await http.get(
        Uri.parse("${Api.appointments}?token=$token"),
        headers: headers,
      );
      //print("API hited");
      dynamic data = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //print("12213123213");

        List<AppointmentDetails> appointments =
            appointmentFromJson(data["data"]);
        onSuccess(appointments);
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
