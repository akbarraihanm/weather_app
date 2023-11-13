import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class AppUtil {
  static bindingInstance(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }

  static Future<Position> getCurrentLocation() async {
    final position = Position.fromMap({
      "latitude": 0.0,
      "longitude": 0.0,
      "timestamp": DateTime.now().millisecondsSinceEpoch,
    });

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location permission is denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Location permissions are"
          " permanently denied, we cannot request permissions."
          " Please open your app setting -> select permission");
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return await Geolocator.getCurrentPosition();
    }

    return position;
  }
}