import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:sugar_mill_app/models/cane_farmer.dart';
import 'package:sugar_mill_app/models/list_crop_sampling_model.dart';
import 'package:sugar_mill_app/models/sampling_formula.dart';
import 'package:sugar_mill_app/models/village_model.dart';
import 'package:sugar_mill_app/services/add_crop_sampling_service.dart';
import '../../../constants.dart';
import '../../../models/agri_cane_model.dart';
import '../../../models/crop_sampling.dart';


class AddCropSmaplingModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  CropSampling cropsamplingdata = CropSampling();
  samplingformula samplingformauladata = samplingformula();
  List<AgriCane> plotList = [];
  List<String> seasonlist = [""];
  List<villagemodel> villagelist = [];
  List<caneFarmer> farmerlist = [];
  late String formulaList;
  String? selectedPlot;
  String? selectedfarcode;
  bool isEdit = false;


  initialise(BuildContext context, String samplingId) async {
    setBusy(true);

    seasonlist = await AddCropSmaplingServices().fetchSeason();
    villagelist=await AddCropSmaplingServices().fetchVillages();
    samplingformauladata =
        await AddCropSmaplingServices().fetchsamplingFormula() ??
            samplingformula();
    if (samplingId != "") {
      isEdit = true;
      cropsamplingdata =
          await AddCropSmaplingServices().getCropSampling(samplingId) ??
              CropSampling();
      plotList = (await AddCropSmaplingServices().fetchcanelistwithfilter(cropsamplingdata.season ?? "",cropsamplingdata.area ?? "",cropsamplingdata.growerCode ?? ""));
      brixbottmAreaController.text = cropsamplingdata.brixBottom?.toStringAsFixed(0) ?? "";
      brixmiddleController.text = cropsamplingdata.brixMiddle?.toStringAsFixed(0) ?? "";
      brixtopController.text = cropsamplingdata.brixTop?.toStringAsFixed(0) ?? "";
      noofpairsController.text = cropsamplingdata.noOfPairs?.toStringAsFixed(0) ?? "";
      for (AgriCane i in plotList) {
         Logger().i(i.growerCode);
        if (i.growerCode == cropsamplingdata.growerCode) {
          selectedfarcode = i.vendorCode;
          Logger().i(selectedfarcode);
          
          notifyListeners();
        }
      }
      cropsamplingdata.plantattionRatooningDate = cropsamplingdata.plantattionRatooningDate != ""
          ? DateFormat('dd-MM-yyyy').format(DateTime.parse(cropsamplingdata.plantattionRatooningDate ?? ""))
          : "";
      notifyListeners();
    }
    if (seasonlist.isEmpty) {
      logout(context);
    }

    setBusy(false);
  }

  void onSavePressed(BuildContext context) async {
    setBusy(true);
    if (formKey.currentState!.validate()) {
      bool res = false;
      Logger().i(cropsamplingdata.toJson().toString());
      if (isEdit == true) {
        res = await AddCropSmaplingServices()
            .updateCropSampling(cropsamplingdata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
             Navigator.pop(context, const MaterialRoute(page: ListSampling)); 
          }
        }
      } else {
        res = await AddCropSmaplingServices().addCropsampling(cropsamplingdata);
        if (res) {
          if (context.mounted) {
            setBusy(false);
            setBusy(false);
            Navigator.pop(context, const MaterialRoute(page: ListSampling)); 
          }
        }
      }
    }
    setBusy(false);
  }
  String? selectedVillage;
  String? selectedoffice;
  String? plantationdate;
  String? selectedplot;
  String? selectedVendorname;
  String? selectedplant;
  String? selectedvillage;
  String? selectedcropvariety;
  String? selectedcroptype;
  double? selectedAreaInAcrs;
  String? selectedvendor;
  String? selectedseason;

  void setSelectedplot(String? plot) {
    selectedPlot = plot;
    cropsamplingdata.id = selectedPlot;
    final selectedCaneData =
        plotList.firstWhere((caneData) => caneData.name.toString() == plot);
    Logger().i(selectedCaneData);
    selectedVendorname = selectedCaneData.growerName;
    selectedplant = selectedCaneData.plantName;
    plantationdate = selectedCaneData.plantattionRatooningDate;
    selectedcropvariety = selectedCaneData.cropVariety;
    selectedcroptype = selectedCaneData.cropType;
    selectedAreaInAcrs = selectedCaneData.areaAcrs;
    selectedvendor = selectedCaneData.vendorCode;
    selectedfarcode = selectedvendor;
    selectedseason = selectedCaneData.season;
    cropsamplingdata.growerName = selectedVendorname;
    cropsamplingdata.plantattionRatooningDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(plantationdate ?? ""));
    cropsamplingdata.cropVariety = selectedcropvariety;
    cropsamplingdata.cropType = selectedcroptype;
    cropsamplingdata.areaAcrs = selectedAreaInAcrs;
    cropsamplingdata.growerCode = selectedvendor;
    cropsamplingdata.season = selectedseason;
    cropsamplingdata.plantName = selectedplant;
    notifyListeners();
  }

  TextEditingController brixbottmAreaController = TextEditingController();
  TextEditingController brixmiddleController = TextEditingController();
  TextEditingController brixtopController = TextEditingController();
  TextEditingController noofpairsController = TextEditingController();

  void setSelectedbrixbottm(String? brixbottm) {
    brixbottmAreaController.value = brixbottmAreaController.value.copyWith(
      text: brixbottm ?? '',
      selection: TextSelection.collapsed(offset: (brixbottm ?? '').length),
    );
    cropsamplingdata.brixBottom = double.parse(brixbottm ?? '');
    setAvgBrix();
    notifyListeners();
  }

  // 'SugarCane is not mature enough to be cut down';
  // void setSelectedgrowercode(String? growercode) {
  //   selectedgrowercode = growercode;
  //   final selectedgrowerData = farmerList.firstWhere(
  //           (growerData) => growerData.existingSupplierCode == growercode);
  //   Logger().i(selectedgrowerData);
  //   selectedgrowername =
  //       selectedgrowerData.supplierName; // Set th distance in the kmController
  //   canedata.growerCode = selectedgrowerData.name;
  //   canedata.growerName = selectedgrowername;
  //   Logger().i(selectedgrowername);
  //   notifyListeners();
  // }
  //
  // void setSelectedgrowername(String? growername) {
  //   selectedgrowername = growername;
  //   canedata.growerName = selectedgrowername;
  //   notifyListeners();
  // }



void setSelectedVillage(BuildContext context,String? village) async {
    selectedVillage = village;
    cropsamplingdata.area = selectedVillage;
    final selectedRouteData =
    villagelist.firstWhere((routeData) => routeData.name == village);
    selectedoffice = selectedRouteData.circleOffice;
    Logger().i(selectedVillage);
    cropsamplingdata.circleOffice = selectedoffice;
    Logger().i(cropsamplingdata.circleOffice);
    farmerlist=await AddCropSmaplingServices().fetchfarmerListwithfilter(cropsamplingdata.area ?? "");
    if (farmerlist.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'There is no Grower available for ${cropsamplingdata.area}',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          duration: const Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }
    notifyListeners();
  }

  void setSelectedbrixmiddle(String? brixmiddle) {
    brixmiddleController.value = brixmiddleController.value.copyWith(
      text: brixmiddle ?? '',
      selection: TextSelection.collapsed(offset: (brixmiddle ?? '').length),
    );
    cropsamplingdata.brixMiddle = double.parse(brixmiddle ?? '');
    setAvgBrix();
    notifyListeners();
  }

  void setSelectedbrixtop(String? brixtop) {
    brixtopController.value = brixtopController.value.copyWith(
      text: brixtop ?? '',
      selection: TextSelection.collapsed(offset: (brixtop ?? '').length),
    );
    cropsamplingdata.brixTop = double.parse(brixtop ?? '');
    setAvgBrix();
    notifyListeners();
  }

  void setAvgBrix() {
    cropsamplingdata.averageBrix = ((cropsamplingdata.brixTop ?? 0.0) +
        (cropsamplingdata.brixMiddle ?? 0.0) +
        (cropsamplingdata.brixBottom ?? 0.0) )/ 3;
    notifyListeners();
  }

  void setSelectednoofpairs(String? noofpairs) {
    noofpairsController.value = noofpairsController.value.copyWith(
      text: noofpairs ?? '',
      selection: TextSelection.collapsed(offset: (noofpairs ?? '').length),
    );
    cropsamplingdata.noOfPairs = int.tryParse(noofpairs ?? "");
    notifyListeners();
  }

  void setSelectedVendor(String? growerCode) {
    Logger().i(growerCode);
    selectedvendor = growerCode;
    notifyListeners();
    cropsamplingdata.growerCode = selectedvendor;
    notifyListeners();
  }

  void setSelectedfarmername(String? growerName) {
    selectedVendorname = growerName;
    cropsamplingdata.growerName = selectedVendorname;
    notifyListeners();
  }

  void setSelectedPlantName(String? plantName) {
    selectedplant = plantName;
    cropsamplingdata.plantName = selectedplant;
    notifyListeners();
  }

  void setSelectedvillage(String? area) {
    selectedvillage = area;
    cropsamplingdata.area = selectedvillage;
    notifyListeners();
  }

  void setSelectedseason(String? season) {
    selectedseason = season;
    cropsamplingdata.season = selectedseason;
    notifyListeners();
  }

  void setSelectedcropvariety(String? cropVariety) {
    selectedcropvariety = cropVariety;
    cropsamplingdata.cropVariety = selectedcropvariety;
    notifyListeners();
  }

  void setSelectedcroptype(String? cropType) {
    selectedcroptype = cropType;
    cropsamplingdata.cropType = selectedcroptype;
    notifyListeners();
  }

  void setSelectedareainacrs(String? cropVariety) {
    selectedAreaInAcrs = double.tryParse(cropVariety ?? "");
    cropsamplingdata.areaAcrs = selectedAreaInAcrs;
    notifyListeners();
  }

  void setSelectedPlantationDate(String? date) {
    plantationdate = date;
    cropsamplingdata.plantattionRatooningDate = plantationdate;
    notifyListeners();
  }


String? selectedgrowername;

  void setSelectedgrowername(BuildContext context,String? growername) async {
    selectedgrowername = growername;
    final selectedgrowerData = farmerlist.firstWhere(
            (growerData) => growerData.supplierName == growername);
    Logger().i(selectedgrowerData);
    selectedfarcode =
        selectedgrowerData.existingSupplierCode; // Set th distance in the kmController
    cropsamplingdata.growerCode = selectedgrowerData.name;
    cropsamplingdata.growerName = selectedgrowername;
    Logger().i(selectedgrowername);
    plotList = (await AddCropSmaplingServices().fetchcanelistwithfilter(cropsamplingdata.season ?? "",cropsamplingdata.area ?? "",cropsamplingdata.growerCode ?? ""));
    if (plotList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'There is no plot available for ${cropsamplingdata.growerName}',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          duration: const Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }
    notifyListeners();
  }

  ////validators////
  String? validateseason(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Season';
    }
    return null;
  }

  String? validatevillage(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select village';
    }
    return null;
  }

  String? validateplotNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Plot Number';
    }
    return null;
  }



  String? validatefarmer(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select farmer';
    }
    return null;
  }

  String? validatebrixbottom(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Brix Bottom';
    }
    return null;
  }

  String? validatebrixtop(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Brix Top';
    }
    return null;
  }

  String? validatebrixMiddle(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Brix Middle';
    }
    return null;
  }

  String? validatenoofpairs(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select no. of pairs';
    }
    return null;
  }
}
