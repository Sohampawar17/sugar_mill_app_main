class villagemodel {
  String? name;
  String? circleOffice;
  String? taluka;

  villagemodel({this.name, this.circleOffice, this.taluka});

  villagemodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    circleOffice = json['circle_office'];
    taluka = json['taluka'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['circle_office'] = circleOffice;
    data['taluka'] = taluka;
    return data;
  }
}
