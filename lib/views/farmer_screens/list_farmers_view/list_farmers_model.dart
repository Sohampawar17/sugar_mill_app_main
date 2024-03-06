import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/models/farmrs_list_model.dart';
import 'package:sugar_mill_app/router.router.dart';
import 'package:sugar_mill_app/services/list_farmers_service.dart';

class ListFarmersModel extends BaseViewModel {
  TextEditingController villageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FarmersListModel listmodel = FarmersListModel();
  List<FarmersListModel> farmresList = [];
  List<FarmersListModel> filteredList = [];
  String farmerNameFilter = "";
  String farmerVillageFilter = "";

  initialise(BuildContext context) async {
    setBusy(true);
    farmresList = await ListFarmersService().getAllFarmersList();
    filteredList = farmresList;
    Logger().i(filteredList);
    setBusy(false);

    notifyListeners();
  }

Future<void> refresh() async {
   filteredList= await ListFarmersService().getAllFarmersList();
  notifyListeners();
}

Color getColorForStatus(String status) {
    switch (status) {
    // Set the color for Draft status
      case 'New':
        return Colors.blueAccent.shade100; // Set the color for On Hold status
      case 'Pending':
        return Colors.redAccent.shade100; // Set the color for To Deliver and Bill status
      case 'Pending For Agriculture Officer':
        return Colors.redAccent.shade100; // Set the color for To Bill status
      case 'Approved':
        return Colors.green; // Set the color for To Deliver status
      case 'Rejected':
        return Colors.red.shade400; // Set the color for Completed status
// Set the color for Cancelled status
    // Set the color for Closed status
      default:
        return Colors.grey; // Set a default color for unknown status
    }
  }

  void onRowClick(BuildContext context, FarmersListModel? farmresList) {
    Navigator.pushNamed(
      context,
      Routes.addFarmerScreen,
      arguments: AddFarmerScreenArguments(farmerid: farmresList?.name ?? ""),
    );
    // Navigator.pushNamed(context, Routes.detailedFarmerScreen,
    //     arguments: DetailedFarmerScreenArguments(id: farmresList?.name ?? ""));
  }

  void filterList(String filter, String query) async {
    notifyListeners();
    filteredList =
        await ListFarmersService().getFarmersListByFilter(filter, query);
    notifyListeners();
  }

  // getFarmersListByNameFilter
  void filterListByNameAndVillage({String? name, String? village}) async {
    farmerNameFilter = name ?? farmerNameFilter;
    farmerVillageFilter = village ?? farmerVillageFilter;
    notifyListeners();
    filteredList = await ListFarmersService()
        .getFarmersListByNameFilter(farmerNameFilter, farmerVillageFilter);
    notifyListeners();
  }
}
