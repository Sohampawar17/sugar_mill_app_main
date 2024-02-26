import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/models/checkin.dart';

import '../constants.dart';
import '../models/employee.dart';

class CheckinServices {
  Future<List<Employee>> fetchmobile(String mobile) async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Employee?filters=[["cell_number","=","$mobile"]]&fields=["employee_name","name"]',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        var jsonData = json.encode(response.data);
        Map<String, dynamic> jsonDataMap = json.decode(jsonData);
        List<dynamic> dataList = jsonDataMap['data'];
        List<Employee> canelistwithfilter =
            dataList.map<Employee>((data) => Employee.fromJson(data)).toList();
        Logger().i(canelistwithfilter);
        return canelistwithfilter;
      } else {
        Logger().e(response.statusCode);
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
      return [];
    }
  }

  Future<bool> addCheckin(Checkin check) async {
    var data = json.encode({
      "data": check,
    });
    Logger().i(check.toString());
    try {
      var dio = Dio();
      var response = await dio.request(
        apiEmployeeCheckin,
        options: Options(
          method: 'POST',
          headers: {'Cookie': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Logger().i("check Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO checkin");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<List<Checkin>> fetchcheckindata(String emp) async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Employee Checkin?filters=[["employee","=","$emp"]]&order_by=creation desc&fields=["log_type","time","employee","employee_name"]',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Checkin> routeList = List.from(jsonData['data'])
            .map<Checkin>((data) => Checkin.fromJson(data))
            .toList();
        return routeList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }
}
