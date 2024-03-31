import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/models/farmrs_list_model.dart';

class ListFarmersService {
  Future<List<FarmersListModel>> getAllFarmersList() async {
    Logger().i(apiFarmerAllListGet);
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apiFarmerAllListGet,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<FarmersListModel> farmersList = List.from(jsonData['data'])
            .map<FarmersListModel>((data) => FarmersListModel.fromJson(data))
            .toList();
        Logger().i(farmersList);
        return farmersList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }

  Future<List<FarmersListModel>> getFarmersListByFilter(
      String query, String filter) async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();

      var response = await dio.request(
        // "http://deverpvppl.erpdata.in/api/resource/Farmer List?fields=['supplier_name','village','name','circle_office']&filters=[['$filter','like','$query'']]",
        "$apiBaseUrl/api/resource/Farmer List?fields=[\"supplier_name\",\"village\",\"name\",\"circle_office\",\"existing_supplier_code\",\"workflow_state\"]&filters=[[\"$filter\",\"like\",\"$query%\"]]&limit_page_length=9999999",
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<FarmersListModel> farmersList = List.from(jsonData['data'])
            .map<FarmersListModel>((data) => FarmersListModel.fromJson(data))
            .toList();
        return farmersList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }

  Future<List<FarmersListModel>> getFarmersListByNameFilter(
      String name, String village) async {
        
        var url=  "$apiBaseUrl/api/method/sugar_mill.sugar_mill.doctype.farmer_list.farmer_list.filterfarmerlist?village=$village&name=$name";
   Logger().i(url);
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        url,
             options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<FarmersListModel> farmersList = List.from(jsonData['message'])
            .map<FarmersListModel>((data) => FarmersListModel.fromJson(data))
            .toList();
        return farmersList;
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
