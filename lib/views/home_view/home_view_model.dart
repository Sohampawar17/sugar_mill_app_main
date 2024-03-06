import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:sugar_mill_app/models/checkin.dart';
import 'package:sugar_mill_app/models/employee.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/chekin_Services.dart';
import 'package:sugar_mill_app/services/geolocation_service.dart';
import '../../services/login_success.dart';

class HomeViewModel extends BaseViewModel {
  Checkin checkindata = Checkin();
  Employee employee = Employee();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  List<String> villageList = [""];
  List<Employee> empList = [];
  List<Checkin> checkinList = [];
  String? mobile;
  String? empname;
  String? empid;
  String? checkvalue;
  String? time;
  String? sharedempid;
   String? greeting;
  String? imageurl;

  void logout(BuildContext context) async {
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    prefs.clear();
    if (context.mounted) {
      Navigator.popAndPushNamed(context, Routes.loginViewScreen);
    }
  }

  initialise(BuildContext context) async {
    setBusy(true);
    final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    mobile = prefs.getString("mobile");
    villageList = await login().fetchVillages();
    if (villageList.isEmpty) {
      final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
      final SharedPreferences prefs = await prefs0;
      prefs.clear();
      if (context.mounted) {
        Navigator.pushNamed(context, Routes.loginViewScreen);
      }
    }
handleGreeting();
handleImage();
    empList = await CheckinServices().fetchmobile(mobile ?? "");
    empname = empList[0].employeeName;
    notifyListeners();
    empid = empList[0].name;
    checkinList = await CheckinServices().fetchcheckindata(empid ?? "");
    setBusy(false);
    checkvalue = checkinList[0].logType;
    time = checkinList[0].time;
    notifyListeners();
    Logger().i(checkvalue);
    Logger().i(time);
  }


 void handleGreeting() {
    final now = DateTime.now();
    final timeOfDay = now.hour;
    if (timeOfDay < 12) {
      greeting = "Good Morning,";
    } else if (timeOfDay < 17) {
      greeting = "Good Afternoon,";
    } else {
      greeting = "Good Evening,";
    }
  }
  void handleImage() {
    final now = DateTime.now();
    final timeOfDay = now.hour;
    if (timeOfDay < 12) {
      imageurl = "assets/images/morning.png";
    } else if (timeOfDay < 17) {
      imageurl = "assets/images/afternoon.png";
    } else {
      imageurl = "assets/images/sunset.png";
    }
  }
  void checkin(BuildContext context) async {
    setBusy(true);

    try {
      checkindata.employee = empid;
      checkindata.logType = "IN";
      checkindata.time = DateTime.now().toString();

      GeolocationService geolocationService = GeolocationService();
      Position? position = await geolocationService.determinePosition();

      if (position == null) {
        Fluttertoast.showToast(msg: 'Failed to get location');
        return setBusy(false);
      }

      Placemark? placemark = await geolocationService.getPlacemarks(position);
      if (placemark == null) {
        Fluttertoast.showToast(msg: 'Failed to get placemark');
        return setBusy(false);
      }

      String formattedAddress =
          await geolocationService.getAddressFromCoordinates(
                  position.latitude, position.longitude) ??
              "";
      checkindata.latitude = position.latitude.toString();
      checkindata.longitude = position.longitude.toString();
      checkindata.deviceId = formattedAddress;

      Logger().i(checkindata.toJson().toString());

      bool res = await CheckinServices().addCheckin(checkindata);
      if (res) {
        setBusy(false);
        checkinList = await CheckinServices().fetchcheckindata(empid ?? "");

        if (checkinList.isNotEmpty) {
          checkvalue = checkinList[0].logType;
          time = checkinList[0].time;
          notifyListeners();
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: "Check-$checkvalue Successfully!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black87,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred: $e');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void checkout(BuildContext context) async {
    setBusy(true);

    try {
      checkindata.employee = empid;
      checkindata.logType = "OUT";
      checkindata.time = DateTime.now().toString();

      GeolocationService geolocationService = GeolocationService();
      Position? position = await geolocationService.determinePosition();

      if (position == null) {
        Fluttertoast.showToast(msg: 'Failed to get location');
        return setBusy(false);
      }

      Placemark? placemark = await geolocationService.getPlacemarks(position);
      if (placemark == null) {
        Fluttertoast.showToast(msg: 'Failed to get placemark');
        return setBusy(false);
      }

      String formattedAddress =
          await geolocationService.getAddressFromCoordinates(
                  position.latitude, position.longitude) ??
              "";
      checkindata.latitude = position.latitude.toString();
      checkindata.longitude = position.longitude.toString();
      checkindata.deviceId = formattedAddress;

      Logger().i(checkindata.toJson().toString());

      bool res = await CheckinServices().addCheckin(checkindata);
      if (res) {
        setBusy(false);
        checkinList = await CheckinServices().fetchcheckindata(empid ?? "");
        if (checkinList.isNotEmpty) {
          checkvalue = checkinList[0].logType;
          time = checkinList[0].time;
          notifyListeners();
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: "Check-$checkvalue Successfully!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black87,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred: $e');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void getGeoLocation() async {
    setBusy(true);
    notifyListeners();
    Position? position = await GeolocationService().determinePosition();
    Logger().i(position);
    Placemark? placemark = await GeolocationService().getPlacemarks(position);
    Fluttertoast.showToast(
        msg: placemark.toString(), toastLength: Toast.LENGTH_LONG);
    setBusy(false);
    notifyListeners();
  }
}
