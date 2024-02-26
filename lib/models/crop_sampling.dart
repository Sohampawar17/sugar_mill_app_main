class CropSampling {
  String? name;
  String? id;
  double? brixBottom;
  double? brixMiddle;
  double? brixTop;
  double? averageBrix;
  int? noOfPairs;
  String? season;
  String? plantationStatus;
  String? plantName;
  String? formNumber;
  String? growerCode;
  String? growerName;
  String? mobileNo;
  String? companyName;
  String? isKisanCard;
  String? surveyNumber;
  String? area;
  String? country;
  String? circleOffice;
  String? taluka;
  String? district;
  String? states;
  String? routeKm;
  String? cropType;
  String? cropVariety;
  double? areaAcrs;
  String? plantattionRatooningDate;
  String? plantationSystem;
  String? irrigationSource;
  String? irrigationMethod;
  String? soilType;
  String? seedMaterial;
  String? roadSide;

  CropSampling(
      {this.name,
      this.id,
      this.brixBottom,
      this.brixMiddle,
      this.brixTop,
      this.averageBrix,
      this.noOfPairs,
      this.season,
      this.plantationStatus,
      this.plantName,
      this.formNumber,
      this.growerCode,
      this.growerName,
      this.mobileNo,
      this.companyName,
      this.isKisanCard,
      this.surveyNumber,
      this.area,
      this.country,
      this.circleOffice,
      this.taluka,
      this.district,
      this.states,
      this.routeKm,
      this.cropType,
      this.cropVariety,
      this.areaAcrs,
      this.plantattionRatooningDate,
      this.plantationSystem,
      this.irrigationSource,
      this.irrigationMethod,
      this.soilType,
      this.seedMaterial,
      this.roadSide});

  CropSampling.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    brixBottom = json['brix_bottom'];
    brixMiddle = json['brix_middle'];
    brixTop = json['brix_top'];
    averageBrix = json['average_brix'];
    noOfPairs = json['no_of_pairs'];
    season = json['season'];
    plantationStatus = json['plantation_status'];
    plantName = json['plant_name'];
    formNumber = json['form_number'];
    growerCode = json['grower_code'];
    growerName = json['grower_name'];
    mobileNo = json['mobile_no'];
    companyName = json['company_name'];
    isKisanCard = json['is_kisan_card'];
    surveyNumber = json['survey_number'];
    area = json['area'];
    country = json['country'];
    circleOffice = json['circle_office'];
    taluka = json['taluka'];
    district = json['district'];
    states = json['states'];
    routeKm = json['route_km'];
    cropType = json['crop_type'];
    cropVariety = json['crop_variety'];
    areaAcrs = json['area_acrs'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    plantationSystem = json['plantation_system'];
    irrigationSource = json['irrigation_source'];
    irrigationMethod = json['irrigation_method'];
    soilType = json['soil_type'];
    seedMaterial = json['seed_material'];
    roadSide = json['road_side'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['brix_bottom'] = brixBottom;
    data['brix_middle'] = brixMiddle;
    data['brix_top'] = brixTop;
    data['average_brix'] = averageBrix;
    data['no_of_pairs'] = noOfPairs;
    data['season'] = season;
    data['plantation_status'] = plantationStatus;
    data['plant_name'] = plantName;
    data['form_number'] = formNumber;
    data['grower_code'] = growerCode;
    data['grower_name'] = growerName;
    data['mobile_no'] = mobileNo;
    data['company_name'] = companyName;
    data['is_kisan_card'] = isKisanCard;
    data['survey_number'] = surveyNumber;
    data['area'] = area;
    data['country'] = country;
    data['circle_office'] = circleOffice;
    data['taluka'] = taluka;
    data['district'] = district;
    data['states'] = states;
    data['route_km'] = routeKm;
    data['crop_type'] = cropType;
    data['crop_variety'] = cropVariety;
    data['area_acrs'] = areaAcrs;
    data['plantattion_ratooning_date'] = plantattionRatooningDate;
    data['plantation_system'] = plantationSystem;
    data['irrigation_source'] = irrigationSource;
    data['irrigation_method'] = irrigationMethod;
    data['soil_type'] = soilType;
    data['seed_material'] = seedMaterial;
    data['road_side'] = roadSide;
    return data;
  }
}
