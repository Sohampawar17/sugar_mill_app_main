import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../constants.dart';
import '../models/list_crop_sampling_model.dart';

class ListCropSamplingServices {
  Future<List<ListSampling>> getAllCropSamplingList() async {
    try {
      var headers = {'Cookie': await getTocken()};
      var dio = Dio();
      var response = await dio.request(
        apiListSampling,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }

  Future<List<ListSampling>> filterListBySeason(
      String season) async {
    try {
      var headers = {'Cookie': await getTocken()};

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling?fields=["id","season","plantation_status","area","form_number","name"]&filters=[["season","like","$season%"]]',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      Logger().i(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
      } else {
        Logger().e(response.statusMessage);
        return [];
      }
    } catch (e) {
      Logger().e(e);
    }

    return [];
  }

  Future<List<ListSampling>> getListByvillagefarmernameFilter(
      String village,String name) async {
    try {
      var headers = {'Cookie': await getTocken()};

      var dio = Dio();
      var response = await dio.request(
        '$apiBaseUrl/api/resource/Crop Sampling?fields=["id","season","plantation_status","area","form_number","name"]&filters=[["area","Like","$village%"],["grower_name","Like","%$name%"]]',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      Logger().i(response);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<ListSampling> caneList = List.from(jsonData['data'])
            .map<ListSampling>((data) => ListSampling.fromJson(data))
            .toList();
        Logger().i(caneList);
        return caneList;
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
