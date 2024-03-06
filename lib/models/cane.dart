class Cane {
  int? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? season;
  String? plantationStatus;
  String? plantName;
  String? formNumber;
  String? growerCode;
  String? vendorCode;
  String? growerName;
  String? mobileNo;
  String? isKisanCard;
  String? village;
  String? route;
  String? area;
  String? circleOffice;
  String? country;
  String? taluka;
  String? district;
  double? routeKm;
  String? routeName;
  String? surveyNumber;
  String? cropType;
  String? isMachine;
  String? cropVariety;
  double? areaAcrs;
  String? plantationSystem;
  String? plantattionRatooningDate;
  String? basalDate;
  String? irrigationSource;
  String? irrigationMethod;
  String? developmentPlot;
  String? soilType;
  String? seedMaterial;
  String? seedType;
  String? roadSide;
  String? supervisorName;
  int? lateRegistration;
  String? longitude;
  String? latitude;
  String? city;
  String? doctype;

  Cane(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.season,
        this.plantationStatus,
        this.plantName,
        this.formNumber,
        this.growerCode,
        this.vendorCode,
        this.growerName,
        this.mobileNo,
        this.isKisanCard,
        this.village,
        this.route,
        this.area,
        this.circleOffice,
        this.country,
        this.taluka,
        this.district,
        this.routeKm,
        this.routeName,
        this.surveyNumber,
        this.cropType,
        this.isMachine,
        this.cropVariety,
        this.areaAcrs,
        this.plantationSystem,
        this.plantattionRatooningDate,
        this.basalDate,
        this.irrigationSource,
        this.irrigationMethod,
        this.developmentPlot,
        this.soilType,
        this.seedMaterial,
        this.seedType,
        this.roadSide,
        this.supervisorName,
        this.lateRegistration,
        this.longitude,
        this.latitude,
        this.city,
        this.doctype});

  Cane.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    season = json['season'];
    plantationStatus = json['plantation_status'];
    plantName = json['plant_name'];
    formNumber = json['form_number'];
    growerCode = json['grower_code'];
    vendorCode = json['vendor_code'];
    growerName = json['grower_name'];
    mobileNo = json['mobile_no'];
    isKisanCard = json['is_kisan_card'];
    village = json['village'];
    route = json['route'];
    area = json['area'];
    circleOffice = json['circle_office'];
    country = json['country'];
    taluka = json['taluka'];
    district = json['district'];
    routeKm = json['route_km'];
    routeName = json['route_name'];
    surveyNumber = json['survey_number'];
    cropType = json['crop_type'];
    isMachine = json['is_machine'];
    cropVariety = json['crop_variety'];
    areaAcrs = json['area_acrs'];
    plantationSystem = json['plantation_system'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    basalDate = json['basal_date'];
    irrigationSource = json['irrigation_source'];
    irrigationMethod = json['irrigation_method'];
    developmentPlot = json['development_plot'];
    soilType = json['soil_type'];
    seedMaterial = json['seed_material'];
    seedType = json['seed_type'];
    roadSide = json['road_side'];
    supervisorName = json['supervisor_name'];
    lateRegistration=json['late_registration'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    city = json['city'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['season'] = season;
    data['plantation_status'] = plantationStatus;
    data['plant_name'] = plantName;
    data['form_number'] = formNumber;
    data['grower_code'] = growerCode;
    data['vendor_code'] = vendorCode;
    data['grower_name'] = growerName;
    data['mobile_no'] = mobileNo;
    data['is_kisan_card'] = isKisanCard;
    data['village'] = village;
    data['route'] = route;
    data['area'] = area;
    data['circle_office'] = circleOffice;
    data['country'] = country;
    data['taluka'] = taluka;
    data['district'] = district;
    data['route_km'] = routeKm;
    data['route_name'] = routeName;
    data['survey_number'] = surveyNumber;
    data['crop_type'] = cropType;
    data['is_machine'] = isMachine;
    data['crop_variety'] = cropVariety;
    data['area_acrs'] = areaAcrs;
    data['plantation_system'] = plantationSystem;
    data['plantattion_ratooning_date'] = plantattionRatooningDate;
    data['basal_date'] = basalDate;
    data['irrigation_source'] = irrigationSource;
    data['irrigation_method'] = irrigationMethod;
    data['development_plot'] = developmentPlot;
    data['soil_type'] = soilType;
    data['seed_material'] = seedMaterial;
    data['seed_type'] = seedType;
    data['road_side'] = roadSide;
    data['supervisor_name'] = supervisorName;
    data['late_registration']=lateRegistration;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['city'] = city;
    data['doctype'] = doctype;
    return data;
  }
}
