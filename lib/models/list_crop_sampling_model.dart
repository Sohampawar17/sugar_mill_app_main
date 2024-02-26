class ListSampling {
  String? id;
  String? season;
  String? plantationStatus;
  String? area;
  String? formNumber;
  String? name;

  ListSampling(
      {this.id,
      this.season,
      this.plantationStatus,
      this.area,
      this.formNumber,
      this.name});

  ListSampling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    season = json['season'];
    plantationStatus = json['plantation_status'];
    area = json['area'];
    formNumber = json['form_number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['season'] = season;
    data['plantation_status'] = plantationStatus;
    data['area'] = area;
    data['form_number'] = formNumber;
    data['name'] = name;
    return data;
  }
}
