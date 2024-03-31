import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:sugar_mill_app/models/cane_farmer.dart';
import 'package:sugar_mill_app/models/cane_route.dart';
import 'package:sugar_mill_app/services/add_cane_service.dart';
import 'package:sugar_mill_app/services/geolocation_service.dart';
import 'package:sugar_mill_app/views/cane_screens/list_cane_view/list_cane_screen.dart';
import '../../../constants.dart';
import '../../../models/cane.dart';
import '../../../models/village_model.dart';
import '../../../widgets/cdate_custom.dart';

class CaneViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController plantationdateController = TextEditingController();
  TextEditingController formNumberController = TextEditingController();
  TextEditingController surveyNumberController = TextEditingController();
  TextEditingController areainAcrsController = TextEditingController();
  TextEditingController baselDateController = TextEditingController();
  Cane canedata = Cane();
  List<String> plantlist = [""];
  bool isCheck = false;
  List<String> seasonlist = [""];
  final List<String> yesno = ["Yes", "No"];
  final List<String> yesnomachine = ["YES", "NO"];
  final List<String> yesnoroadside = ["Yes (होय)", "No (नाही)"];
  final List<String> plantationStatus = [
    "New",
    "Harvester",
    "Diversion",
    "Added To Sampling",
    "Added To Harvesting",
    "To Sampling",
    "To Harvesting"
  ];
  final List<String> seedType = ["Regular", "Foundation"];
  List<caneFarmer> farmerList = [];
  List<villagemodel> villageList = [];
  List<String> canevarietyList = [""];
  List<String> plantationsystemList = [""];
  List<String> seedmaterialList = [""];
  List<String> croptypeList = [""];
  List<caneRoute> routeList = [];
  List<String> irrigationmethodList = [""];
  List<String> irrigationSourceList = [""];
  List<String> soilTypeList = [""];
  List<String> cropVarietyList = [""];
  late String caneId;
  String? name;
  String? selectedVillage;
  String? selectedirrigationmethod;
  String? selectedirrigationsource;
  String? selectedcroptype;
  String? selectedcropVariety;
  String? selectedSoilType;
  String? selectedSeedMaterial;
  String? selectedRoute;
  String? selectedPlantationSystem;
  double? selectedDistance;
  String? selectedvillage;
  DateTime? selectedDate;
  DateTime? selectedBaselDate;
  String? selectedCaneRoute = "";
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  initialise(BuildContext context, String caneId) async {
    setBusy(true);
    villageList = await AddCaneService().fetchVillages();
    plantlist = await AddCaneService().fetchPlant();
    seasonlist = await AddCaneService().fetchSeason();
    canevarietyList = await AddCaneService().fetchCaneVariety();
    plantationsystemList = await AddCaneService().fetchplantationsystem();
    seedmaterialList = await AddCaneService().fetchseedMaterial();
    routeList = (await AddCaneService().fetchroute());
    croptypeList = await AddCaneService().fetchCropType();
    irrigationmethodList = await AddCaneService().fetchirrigationmethod();
    irrigationSourceList = await AddCaneService().fetchIrrigationSource();
    soilTypeList = await AddCaneService().fetchSoilType();
    Logger().i(villageList.length);
    canedata.plantName = "Bedkihal";
    canedata.plantationStatus = "New";
    Logger().i(caneId);
    if (caneId != "") {
      isEdit = true;
      canedata = await AddCaneService().getCane(caneId) ?? Cane();
      selectedCaneRoute = canedata.route;
      isCheck=canedata.lateRegistration == 1 ? true : false;
      for (caneRoute i in routeList) {
        if (i.name == canedata.route) {
          selectedCaneRoute = i.route;
        }
      }
      notifyListeners();
      areainAcrsController.text = canedata.areaAcrs.toString();
      surveyNumberController.text = canedata.surveyNumber ?? "";
      formNumberController.text = canedata.formNumber ?? "";
      // Define the desired date format

// Format and set plantationRatooningDate
      plantationdateController.text = canedata.plantattionRatooningDate != ""
          ? dateFormat
              .format(DateTime.parse(canedata.plantattionRatooningDate ?? ""))
          : "";

// Format and set basalDate
      String? formattedDate = canedata.basalDate != null
          ? dateFormat.format(DateTime.parse(canedata.basalDate ?? ""))
          : canedata.basalDate ?? "";

      baselDateController.text = formattedDate;
    }
    if (villageList.isEmpty) {
      logout(context);
    }
    setBusy(false);
  }


void showSuccessDialog(BuildContext context,String? name) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("$name plot registered successfully"),
      
        actions: [
          TextButton(
            onPressed: () {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ListCaneScreen()),
  ); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

  void onSavePressed(BuildContext context) async {
    setBusy(true);

    if (formKey.currentState!.validate()) {
      bool res = false;
      // Create an instance of your GeolocationService
      GeolocationService geolocationService = GeolocationService();

      // Get the user's position using the geolocation service
      Position? position = await geolocationService.determinePosition();

      if (position != null) {
        // Get the placemark using the geolocation service
        Placemark? placemark = await geolocationService.getPlacemarks(position);

        if (placemark != null) {
          // Extract properties from the placemark
          String street = placemark.street ?? '';
          String subLocality = placemark.subLocality ?? '';
          String locality = placemark.locality ?? '';
          String postalCode = placemark.postalCode ?? '';
          String country = placemark.country ?? '';

          // Create a formatted address string
          String formattedAddress = '$street, $subLocality, $locality $postalCode, $country';

          // Update canedata object with latitude, longitude, and address
          canedata.latitude = position.latitude.toString();
          canedata.longitude = position.longitude.toString();
          canedata.city = formattedAddress;
          Logger().i(canedata.toJson().toString());

          // Now you have the updated canedata object with location information
          // You can proceed with saving the data

          // print("UPDATING ROUTE: ${canedata.route} $selectedCaneRoute");
          // canedata.route = selectedCaneRoute;

          if (isEdit == true) {
            res = await AddCaneService().updateCane(canedata);
              if (res) {
                
            if (context.mounted) {
            Navigator.pop(context, const MaterialRoute(page: ListCaneScreen)); 
            }
          }
          } else {
            name = await AddCaneService().addCane(canedata);
             if (name!.isNotEmpty) {
    showSuccessDialog(context,name);
    }
          }

        
        } else {
          // Handle case where placemark is null
          Fluttertoast.showToast(msg: 'Failed to get placemark');
        }
      } else {
        // Handle case where obtaining location fails
        Fluttertoast.showToast(msg: 'Failed to get location');
      }
    }

    setBusy(false);
  }


  String errorMessage = '';

  void onplantationdateChanged(String value) {
    String formattedDate = DateInputHelper.formatInput(value);
    bool isValidDate = DateInputHelper.isValidDate(formattedDate);
    plantationdateController.value = plantationdateController.value.copyWith(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: formattedDate.length),
    );
    if (isValidDate) {
      errorMessage = '';
      // Parse the formatted date using "dd-MM-yyyy" format
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(formattedDate);

// Format the parsed date into "yyyy-MM-dd" format
      String formattedDateInDesiredFormat =
          DateFormat('yyyy-MM-dd').format(parsedDate);

      Logger().i(formattedDateInDesiredFormat);
      selectedDate = DateTime.parse(formattedDateInDesiredFormat);
      canedata.plantattionRatooningDate =
          DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      // Format selectedDate as "YYYY-MM-DD" string
    } else {
      errorMessage = 'Invalid date';
    }
  }

  String errorMessageforbasel = '';
  void onBaseldateChanged(String value) {
    String formattedDate = DateInputHelper.formatInput(value);
    bool isValidDate = DateInputHelper.isValidDate(formattedDate);
    baselDateController.value = baselDateController.value.copyWith(
      text: formattedDate,
      selection: TextSelection.collapsed(offset: formattedDate.length),
    );
    if (isValidDate) {
      errorMessageforbasel = '';
      // Parse the formatted date using "dd-MM-yyyy" format
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(formattedDate);

// Format the parsed date into "yyyy-MM-dd" format
      String formattedDateInDesiredFormat =
          DateFormat('yyyy-MM-dd').format(parsedDate);

      Logger().i(formattedDateInDesiredFormat);
      selectedDate = DateTime.parse(formattedDateInDesiredFormat);
      canedata.basalDate =
          DateFormat('yyyy-MM-dd').format(selectedDate ?? DateTime.now());
      // Format selectedDate as "YYYY-MM-DD" string
    } else {
      errorMessageforbasel = 'Invalid date';
    }
  }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     plantationdateController.text = DateFormat('yyyy-MM-dd').format(picked);
  //     canedata.plantattionRatooningDate = plantationdateController.text;
  //   }
  // }
  //
  // Future<void> selectBaselDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedBaselDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != selectedBaselDate) {
  //     selectedBaselDate = picked;
  //     baselDateController.text = DateFormat('yyyy-MM-dd').format(picked);
  //     canedata.basalDate = baselDateController.text;
  //   }
  // }

  void setSelectedseedType(String? seedType) {
    canedata.seedType = seedType;
    notifyListeners();
  }

  void setSelectedareainacrs(String? areainAcrs) {
    areainAcrsController.value = areainAcrsController.value.copyWith(
      text: areainAcrs ?? '',
      selection: TextSelection.collapsed(offset: (areainAcrs ?? '').length),
    );
    canedata.areaAcrs = double.tryParse(areainAcrs ?? "") ?? 0;
    notifyListeners();
  }

  void setselectedcropVariety(String? cropVariety) {
    selectedcropVariety = cropVariety;
    canedata.cropVariety = selectedcropVariety;
    notifyListeners();
  }

  void setSelectedVillage(BuildContext context, String? village) async {
    selectedVillage = village;
    canedata.village = selectedVillage;
    Logger().i(village);
    farmerList =
        await AddCaneService().fetchfarmerListwithfilter(village ?? "");
    if (farmerList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,

          content: Text(
            'There is no Approved farmer Available At $village village',
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          duration: const Duration(seconds: 3), // Adjust the duration as needed
        ),
      );
    }
    Logger().i(farmerList.length);
    // final selectedRouteData =
    //     villageList.firstWhere((routeData) => routeData.name == village);

    Logger().i(canedata.circleOffice);
    // Set th distance in the kmController
    notifyListeners();
  }

  void setselectedRoute(caneRoute route) {
    Logger().i("ROUTE IS: $route");
    selectedRoute = route.route;
    selectedCaneRoute = route.route;
    canedata.route = route.name;
    notifyListeners();
    selectedDistance = route.distanceKm; // Set th distance in the kmController
    canedata.routeKm = selectedDistance;
    selectedvillage = route.circleOffice;
    Logger().i(selectedvillage);
    canedata.circleOffice = selectedvillage;
    Logger().i(selectedDistance);
    notifyListeners();
  }

  void setroutekm(double? routekm) {
    selectedDistance = routekm;
    canedata.routeKm = selectedDistance;
    notifyListeners();
  }

  void setselectedSeedMaterial(String? seedMaterial) {
    selectedSeedMaterial = seedMaterial;
    canedata.seedMaterial = selectedSeedMaterial;
    notifyListeners();
  }

  void setselectedPlantationSystem(String? plantationSystem) {
    selectedPlantationSystem = plantationSystem;
    canedata.plantationSystem = selectedPlantationSystem;
    notifyListeners();
  }

  void setSelectedcircleoffice(String? office) {
    selectedvillage = office;
    canedata.circleOffice = selectedvillage;
    notifyListeners();
  }

  void setSelectedPlant(String? plant) {
    canedata.plantName = plant;
    notifyListeners();
  }

  void setcheck(bool? plant) {
    isCheck=plant ?? false;
    canedata.lateRegistration = isCheck ? 1:0;
    Logger().i(canedata.lateRegistration);
    notifyListeners();
  }

  void setSelectedSeason(String? season) {
    canedata.season = season;
    notifyListeners();
  }

  void setSelectedDevelopmentplot(String? developmentPlot) {
    canedata.developmentPlot = developmentPlot;
    notifyListeners();
  }

  void setSelectedisMachine(String? isMachine) {
    canedata.isMachine = isMachine;
    notifyListeners();
  }

  void setSelectedirrigationmethod(String? irrigationmethod) {
    selectedirrigationmethod = irrigationmethod;
    canedata.irrigationMethod = selectedirrigationmethod;
    notifyListeners();
  }

  void setSelectedirrigationsource(String? irrigationsource) {
    selectedirrigationsource = irrigationsource;
    canedata.irrigationSource = selectedirrigationsource;
    notifyListeners();
  }

  void setSelectedcroptype(String? croptype) {
    selectedcroptype = croptype;
    canedata.cropType = selectedcroptype;
    notifyListeners();
  }

  void setSelectedSoilType(String? soilType) {
    selectedSoilType = soilType;
    canedata.soilType = selectedSoilType;
    notifyListeners();
  }

  String? selectedgrowercode;
  String? selectedgrowername;

  void setSelectedgrowercode(String? growercode) {
    selectedgrowercode = growercode;
    final selectedgrowerData = farmerList.firstWhere(
        (growerData) => growerData.existingSupplierCode == growercode);
    Logger().i(selectedgrowerData);
    selectedgrowername =
        selectedgrowerData.supplierName; // Set th distance in the kmController
    canedata.growerCode = selectedgrowerData.name;
    canedata.growerName = selectedgrowername;
    Logger().i(selectedgrowername);
    notifyListeners();
  }

  void setSelectedgrowername(String? growername) {
    selectedgrowername = growername;
    canedata.growerName = selectedgrowername;
    notifyListeners();
  }

  void setSelectedkisan(String? kisan) {
    canedata.isKisanCard = kisan;
    notifyListeners();
  }

  void setSelectedplantation(String? plantationStatus) {
    canedata.plantationStatus = plantationStatus;
    notifyListeners();
  }

  void setSelectedRoadSIde(String? roadside) {
    canedata.roadSide = roadside;
    notifyListeners();
  }

  void setsurveyNumber(String? surveyNumber) {
    surveyNumberController.value = surveyNumberController.value.copyWith(
      text: surveyNumber ?? '',
      selection: TextSelection.collapsed(offset: (surveyNumber ?? '').length),
    );
    canedata.surveyNumber = surveyNumber ?? '';
    notifyListeners();
  }

  void setFormNumber(String? formNumber) {
    formNumberController.value = formNumberController.value.copyWith(
      text: formNumber ?? '',
      selection: TextSelection.collapsed(offset: (formNumber ?? '').length),
    );
    canedata.formNumber = formNumber ?? '';
    notifyListeners();
  }

  bool isEdit = false;

  getVisibility() {
    return isEdit;
  }

  ////////////////// validators ////////////////////////////////////

  String? validateAreaInAcrs(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Area in Acrs';
    }
    return null;
  }

  String? validateplantationdate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select plantation date';
    }
    return null;
  }

  String? validateRoute(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Route';
    }
    return null;
  }

  String? validateVillage(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Village';
    }
    return null;
  }

  String? validatePlantationSystem(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Plantation System';
    }
    return null;
  }

  String? validatePlant(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Plant';
    }
    return null;
  }

  String? validateCropVariety(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Crop Variety';
    }
    return null;
  }

  String? validateSeedMaterial(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Seed Material';
    }
    return null;
  }

  String? validateirrigationMethod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Irrigation Method';
    }
    return null;
  }

  String? validateirrigationSource(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Irrigation Source';
    }
    return null;
  }

  String? validateSeason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Season';
    }
    return null;
  }

  String? validateSoilType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Soil Type';
    }
    return null;
  }

  String? validateGrowerCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Grower Code';
    }
    return null;
  }

  String? validateKisanCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Is Kisan Card';
    }
    return null;
  }

  String? validatePlantationStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select plantation status';
    }
    return null;
  }

  String? validateRoadSide(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Road Side';
    }
    return null;
  }

  String? validateCropType(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select Crop Type';
    }
    return null;
  }
}
