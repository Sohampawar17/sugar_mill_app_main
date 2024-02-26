import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants.dart';
import '../../../models/agri_list_model.dart';
import '../../../router.router.dart';
import '../../../services/add_cane_service.dart';
import '../../../services/list_agri_services.dart';

class ListAgriModel extends BaseViewModel {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController seasoncontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  String caneSeasonFilter = "";
  String caneVillageFilter = "";
  String caneNameFilter = "";
  List<AgriListModel> agriList = [];
  List<AgriListModel> filteredagriList = [];
  List<String> seasonlist = [""];

  initialise(BuildContext context) async {
    setBusy(true);
    agriList = (await ListAgriService().getAllCaneList()).cast<AgriListModel>();
    seasonlist = await AddCaneService().fetchSeason();
    filteredagriList = agriList;
    setBusy(false);
    if (seasonlist.isEmpty) {
      logout(context);
    }
    notifyListeners();
  }
///dhdjhdjhj
  void filterListBySeason({String? name}) async {
    caneSeasonFilter = name ?? caneSeasonFilter;
    notifyListeners();
    filteredagriList =
        await ListAgriService().getAgriListByNameFilter(caneSeasonFilter);
    notifyListeners();
  }

  void getAgriListByvillagefarmernameFilter({String? village, String? name}) async {
    caneNameFilter = name ?? caneNameFilter;
    caneVillageFilter = village ?? caneVillageFilter;
    notifyListeners();
    filteredagriList = await ListAgriService()
        .getAgriListByvillagefarmernameFilter(caneVillageFilter, caneNameFilter);
    notifyListeners();
  }

  void onRowClick(BuildContext context, AgriListModel? agriList) {
    Navigator.pushNamed(
      context,
      Routes.addAgriScreen,
      arguments: AddAgriScreenArguments(agriId: agriList?.name ?? ""),
    );
    // Navigator.pushNamed(context, Routes.detailedFarmerScreen,
    //     arguments: DetailedFarmerScreenArguments(id: farmresList?.name ?? ""));
  }
}
