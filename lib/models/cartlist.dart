class CartInfo {
  String? name;
  String? hTNo;
  String? transporter;
  String? transporterName;
  String? transporterCode;
  String? harvester;
  String? harvesterCode;
  String? harvesterName;
  String? vehicleType;
  String? gangType;

  CartInfo(
      {this.name,
        this.hTNo,
        this.transporter,
        this.transporterName,
        this.transporterCode,
        this.harvester,
        this.harvesterCode,
        this.harvesterName,
        this.vehicleType,
        this.gangType});

  CartInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hTNo = json['h_t_no'];
    transporter = json['transporter'];
    transporterName = json['transporter_name'];
    transporterCode = json['transporter_code'];
    harvester = json['harvester'];
    harvesterCode = json['harvester_code'];
    harvesterName = json['harvester_name'];
    vehicleType = json['vehicle_type'];
    gangType = json['gang_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['h_t_no'] = hTNo;
    data['transporter'] = transporter;
    data['transporter_name'] = transporterName;
    data['transporter_code'] = transporterCode;
    data['harvester'] = harvester;
    data['harvester_code'] = harvesterCode;
    data['harvester_name'] = harvesterName;
    data['vehicle_type'] = vehicleType;
    data['gang_type'] = gangType;
    return data;
  }
}
