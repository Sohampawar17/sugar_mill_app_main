class TransportInfo {
  String? name;
  String? oldNo;
  String? transporterName;
  String? transporterCode;
  String? harvesterCode;
  String? harvesterName;
  String? vehicleType;
  String? vehicleNo;
  String? trolly1;
  String? trolly2;
  String? gangType;

  TransportInfo(
      {this.name,
        this.oldNo,
        this.transporterName,
        this.transporterCode,
        this.harvesterCode,
        this.harvesterName,
        this.vehicleType,
        this.vehicleNo,
        this.trolly1,
        this.trolly2,
        this.gangType});

  TransportInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    oldNo = json['old_no'];
    transporterName = json['transporter_name'];
    transporterCode = json['transporter_code'];
    harvesterCode = json['harvester_code'];
    harvesterName = json['harvester_name'];
    vehicleType = json['vehicle_type'];
    vehicleNo = json['vehicle_no'];
    trolly1 = json['trolly_1'];
    trolly2 = json['trolly_2'];
    gangType = json['gang_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['old_no'] = this.oldNo;
    data['transporter_name'] = this.transporterName;
    data['transporter_code'] = this.transporterCode;
    data['harvester_code'] = this.harvesterCode;
    data['harvester_name'] = this.harvesterName;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_no'] = this.vehicleNo;
    data['trolly_1'] = this.trolly1;
    data['trolly_2'] = this.trolly2;
    data['gang_type'] = this.gangType;
    return data;
  }
}
