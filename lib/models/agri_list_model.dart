class AgriListModel {
  String? cropType;
  String? cropVariety;
  String? date;
  double? area;
  String? village;
  String? name;
  String? surveyNumber;

  AgriListModel(
      {this.cropType,
        this.cropVariety,
        this.date,
        this.area,
        this.village,
        this.name,
        this.surveyNumber});

  AgriListModel.fromJson(Map<String, dynamic> json) {
    cropType = json['crop_type'];
    cropVariety = json['crop_variety'];
    date = json['date'];
    area = json['area'];
    village = json['village'];
    name = json['name'];
    surveyNumber = json['survey_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['crop_type'] = cropType;
    data['crop_variety'] = cropVariety;
    data['date'] = date;
    data['area'] = area;
    data['village'] = village;
    data['name'] = name;
    data['survey_number'] = surveyNumber;
    return data;
  }
}
