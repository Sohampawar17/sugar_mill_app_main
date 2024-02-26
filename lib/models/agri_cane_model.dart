class AgriCane {
  String? vendorCode;
  double? routeKm;
  String? growerName;
  String? growerCode;
  String? area;
  String? cropType;
  String? cropVariety;
  String? plantattionRatooningDate;
  double? areaAcrs;
  String? plantName;
  int? name;
  String? soilType;
  String? season;

  AgriCane(
      {this.vendorCode,
      this.routeKm,
      this.growerName,
      this.growerCode,
      this.area,
      this.cropType,
      this.cropVariety,
      this.plantattionRatooningDate,
      this.areaAcrs,
      this.plantName,
      this.name,
      this.soilType,
      this.season});

  AgriCane.fromJson(Map<String, dynamic> json) {
    vendorCode = json['vendor_code'];
    routeKm = json['route_km'];
    growerName = json['grower_name'];
    growerCode = json['grower_code'];
    area = json['area'];
    cropType = json['crop_type'];
    cropVariety = json['crop_variety'];
    plantattionRatooningDate = json['plantattion_ratooning_date'];
    areaAcrs = json['area_acrs'];
    plantName = json['plant_name'];
    name = json['name'];
    soilType = json['soil_type'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_code'] = this.vendorCode;
    data['route_km'] = this.routeKm;
    data['grower_name'] = this.growerName;
    data['grower_code'] = this.growerCode;
    data['area'] = this.area;
    data['crop_type'] = this.cropType;
    data['crop_variety'] = this.cropVariety;
    data['plantattion_ratooning_date'] = this.plantattionRatooningDate;
    data['area_acrs'] = this.areaAcrs;
    data['plant_name'] = this.plantName;
    data['name'] = this.name;
    data['soil_type'] = this.soilType;
    data['season'] = this.season;
    return data;
  }
}
