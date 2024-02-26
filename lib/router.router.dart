// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;
import 'package:sugar_mill_app/views/agriculture_screens/add_agri_view/add_agri_screen.dart'
    as _i9;
import 'package:sugar_mill_app/views/agriculture_screens/list_agri_view/list_agri_screen.dart'
    as _i10;
import 'package:sugar_mill_app/views/cane_screens/add_cane_view/add_cane_screen.dart'
    as _i7;
import 'package:sugar_mill_app/views/cane_screens/list_cane_view/list_cane_screen.dart'
    as _i8;
import 'package:sugar_mill_app/views/Crop_Sampling_screens/add_sampling_view/add_crop_sampling_screen.dart'
    as _i11;
import 'package:sugar_mill_app/views/Crop_Sampling_screens/list_sampling_view/list_sampling_screen.dart'
    as _i12;
import 'package:sugar_mill_app/views/farmer_screens/add_farmer_view/add_farmer_screen.dart'
    as _i5;
import 'package:sugar_mill_app/views/farmer_screens/list_farmers_view/list_farmers_screen.dart'
    as _i6;
import 'package:sugar_mill_app/views/home_view/home_view_screen.dart' as _i3;
import 'package:sugar_mill_app/views/login_view/login_view_screen.dart' as _i4;
import 'package:sugar_mill_app/views/splash_screen_view/splash_screen.dart'
    as _i2;
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_list/add_tripsheet_list_screen.dart'
    as _i14;
import 'package:sugar_mill_app/views/tripsheet_screen/add_tripsheet_view/add_tripsheet_screen.dart'
    as _i13;

class Routes {
  static const splashScreen = '/';

  static const homePageScreen = '/home-page-screen';

  static const loginViewScreen = '/login-view-screen';

  static const addFarmerScreen = '/add-farmer-screen';

  static const listFarmersScreen = '/list-farmers-screen';

  static const addCaneScreen = '/add-cane-screen';

  static const listCaneScreen = '/list-cane-screen';

  static const addAgriScreen = '/add-agri-screen';

  static const listAgriScreen = '/list-agri-screen';

  static const addCropSamplingScreen = '/add-crop-sampling-screen';

  static const listSamplingScreen = '/list-sampling-screen';

  static const addTripsheetScreen = '/add-tripsheet-screen';

  static const tripsheetMaster = '/tripsheet-master';

  static const all = <String>{
    splashScreen,
    homePageScreen,
    loginViewScreen,
    addFarmerScreen,
    listFarmersScreen,
    addCaneScreen,
    listCaneScreen,
    addAgriScreen,
    listAgriScreen,
    addCropSamplingScreen,
    listSamplingScreen,
    addTripsheetScreen,
    tripsheetMaster,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homePageScreen,
      page: _i3.HomePageScreen,
    ),
    _i1.RouteDef(
      Routes.loginViewScreen,
      page: _i4.LoginViewScreen,
    ),
    _i1.RouteDef(
      Routes.addFarmerScreen,
      page: _i5.AddFarmerScreen,
    ),
    _i1.RouteDef(
      Routes.listFarmersScreen,
      page: _i6.ListFarmersScreen,
    ),
    _i1.RouteDef(
      Routes.addCaneScreen,
      page: _i7.AddCaneScreen,
    ),
    _i1.RouteDef(
      Routes.listCaneScreen,
      page: _i8.ListCaneScreen,
    ),
    _i1.RouteDef(
      Routes.addAgriScreen,
      page: _i9.AddAgriScreen,
    ),
    _i1.RouteDef(
      Routes.listAgriScreen,
      page: _i10.ListAgriScreen,
    ),
    _i1.RouteDef(
      Routes.addCropSamplingScreen,
      page: _i11.AddCropSamplingScreen,
    ),
    _i1.RouteDef(
      Routes.listSamplingScreen,
      page: _i12.ListSamplingScreen,
    ),
    _i1.RouteDef(
      Routes.addTripsheetScreen,
      page: _i13.AddTripsheetScreen,
    ),
    _i1.RouteDef(
      Routes.tripsheetMaster,
      page: _i14.TripsheetMaster,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.HomePageScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomePageScreen(),
        settings: data,
      );
    },
    _i4.LoginViewScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginViewScreen(),
        settings: data,
      );
    },
    _i5.AddFarmerScreen: (data) {
      final args = data.getArgs<AddFarmerScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.AddFarmerScreen(key: args.key, farmerid: args.farmerid),
        settings: data,
      );
    },
    _i6.ListFarmersScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ListFarmersScreen(),
        settings: data,
      );
    },
    _i7.AddCaneScreen: (data) {
      final args = data.getArgs<AddCaneScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.AddCaneScreen(key: args.key, caneId: args.caneId),
        settings: data,
      );
    },
    _i8.ListCaneScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ListCaneScreen(),
        settings: data,
      );
    },
    _i9.AddAgriScreen: (data) {
      final args = data.getArgs<AddAgriScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.AddAgriScreen(key: args.key, agriId: args.agriId),
        settings: data,
      );
    },
    _i10.ListAgriScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ListAgriScreen(),
        settings: data,
      );
    },
    _i11.AddCropSamplingScreen: (data) {
      final args = data.getArgs<AddCropSamplingScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.AddCropSamplingScreen(
            key: args.key, samplingId: args.samplingId),
        settings: data,
      );
    },
    _i12.ListSamplingScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ListSamplingScreen(),
        settings: data,
      );
    },
    _i13.AddTripsheetScreen: (data) {
      final args = data.getArgs<AddTripsheetScreenArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.AddTripsheetScreen(key: args.key, tripId: args.tripId),
        settings: data,
      );
    },
    _i14.TripsheetMaster: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.TripsheetMaster(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddFarmerScreenArguments {
  const AddFarmerScreenArguments({
    this.key,
    required this.farmerid,
  });

  final _i15.Key? key;

  final String farmerid;

  @override
  String toString() {
    return '{"key": "$key", "farmerid": "$farmerid"}';
  }

  @override
  bool operator ==(covariant AddFarmerScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.farmerid == farmerid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ farmerid.hashCode;
  }
}

class AddCaneScreenArguments {
  const AddCaneScreenArguments({
    this.key,
    required this.caneId,
  });

  final _i15.Key? key;

  final String caneId;

  @override
  String toString() {
    return '{"key": "$key", "caneId": "$caneId"}';
  }

  @override
  bool operator ==(covariant AddCaneScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.caneId == caneId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ caneId.hashCode;
  }
}

class AddAgriScreenArguments {
  const AddAgriScreenArguments({
    this.key,
    required this.agriId,
  });

  final _i15.Key? key;

  final String agriId;

  @override
  String toString() {
    return '{"key": "$key", "agriId": "$agriId"}';
  }

  @override
  bool operator ==(covariant AddAgriScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.agriId == agriId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ agriId.hashCode;
  }
}

class AddCropSamplingScreenArguments {
  const AddCropSamplingScreenArguments({
    this.key,
    required this.samplingId,
  });

  final _i15.Key? key;

  final String samplingId;

  @override
  String toString() {
    return '{"key": "$key", "samplingId": "$samplingId"}';
  }

  @override
  bool operator ==(covariant AddCropSamplingScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.samplingId == samplingId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ samplingId.hashCode;
  }
}

class AddTripsheetScreenArguments {
  const AddTripsheetScreenArguments({
    this.key,
    required this.tripId,
  });

  final _i15.Key? key;

  final String tripId;

  @override
  String toString() {
    return '{"key": "$key", "tripId": "$tripId"}';
  }

  @override
  bool operator ==(covariant AddTripsheetScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.tripId == tripId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ tripId.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddFarmerScreen({
    _i15.Key? key,
    required String farmerid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addFarmerScreen,
        arguments: AddFarmerScreenArguments(key: key, farmerid: farmerid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListFarmersScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listFarmersScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCaneScreen({
    _i15.Key? key,
    required String caneId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCaneScreen,
        arguments: AddCaneScreenArguments(key: key, caneId: caneId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListCaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listCaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddAgriScreen({
    _i15.Key? key,
    required String agriId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addAgriScreen,
        arguments: AddAgriScreenArguments(key: key, agriId: agriId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListAgriScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listAgriScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCropSamplingScreen({
    _i15.Key? key,
    required String samplingId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCropSamplingScreen,
        arguments:
            AddCropSamplingScreenArguments(key: key, samplingId: samplingId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTripsheetScreen({
    _i15.Key? key,
    required String tripId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTripsheetScreen,
        arguments: AddTripsheetScreenArguments(key: key, tripId: tripId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTripsheetMaster([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tripsheetMaster,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginViewScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginViewScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddFarmerScreen({
    _i15.Key? key,
    required String farmerid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addFarmerScreen,
        arguments: AddFarmerScreenArguments(key: key, farmerid: farmerid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListFarmersScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listFarmersScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCaneScreen({
    _i15.Key? key,
    required String caneId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCaneScreen,
        arguments: AddCaneScreenArguments(key: key, caneId: caneId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListCaneScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listCaneScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddAgriScreen({
    _i15.Key? key,
    required String agriId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addAgriScreen,
        arguments: AddAgriScreenArguments(key: key, agriId: agriId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListAgriScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listAgriScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCropSamplingScreen({
    _i15.Key? key,
    required String samplingId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCropSamplingScreen,
        arguments:
            AddCropSamplingScreenArguments(key: key, samplingId: samplingId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListSamplingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listSamplingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddTripsheetScreen({
    _i15.Key? key,
    required String tripId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addTripsheetScreen,
        arguments: AddTripsheetScreenArguments(key: key, tripId: tripId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTripsheetMaster([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tripsheetMaster,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
