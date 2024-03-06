import 'package:flutter/cupertino.dart';

import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../models/tripsheet_list_search.dart';
import '../../../router.router.dart';
import '../../../services/list_tripsheet_service.dart';

class ListTripsheet extends BaseViewModel {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  List<TripSheetSearch> triSheetList = [];
  List<TripSheetSearch> tripSheetFilter = [];
  List<String> seasonlist = [];
  String tripsheetVillageFilter = "";
  String tripsheeNameFilter = "";
  String tripsheetSeasonFilter = "";

  initialise(BuildContext context) async {
    setBusy(true);
    triSheetList = (await ListTripshhetService().getAllTripsheetList())
        .cast<TripSheetSearch>();
    tripSheetFilter = triSheetList;
    seasonlist = await ListTripshhetService().fetchSeason();
    setBusy(false);
    if (seasonlist.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }

Future<void> refresh() async {
   tripSheetFilter= (await ListTripshhetService().getAllTripsheetList())
        .cast<TripSheetSearch>();
  notifyListeners();
}

  void filterList(String filter, int query) async {
    notifyListeners();
    tripSheetFilter =
        await ListTripshhetService().getAllTripsheetListfilter(filter, query);
    notifyListeners();
  }

  void filterListByNameAndVillage(
      {String? transName, String? village, String? season}) async {
    tripsheeNameFilter = transName ?? tripsheeNameFilter;
    tripsheetVillageFilter = village ?? tripsheetVillageFilter;
    tripsheetSeasonFilter = season ?? tripsheetSeasonFilter;
    notifyListeners();
    tripSheetFilter = await ListTripshhetService().getTransporterNameFilter(
        tripsheeNameFilter, tripsheetVillageFilter, tripsheetSeasonFilter);
    notifyListeners();
  }

  void onRowClick(BuildContext context, TripSheetSearch? tripList) {
    Navigator.pushNamed(
      context,
      Routes.addTripsheetScreen,
      arguments:
          AddTripsheetScreenArguments(tripId: tripList?.name.toString() ?? " "),
    );
  }
}
