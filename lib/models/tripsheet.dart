class Tripsheet {
  int? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? tripsheetNo;
  String? date;
  int? slipNo;
  String? season;
  String? branch;
  String? plotNo;
  String? platNoId;
  String? farmerCode;
  String? farmerName;
  String? fieldVillage;
  String? caneVariety;
  String? plantationDate;
  String? surveryNo;
  double? areaAcre;
  String? routeName;
  double? distance;
  String? burnCane;
  double? deduction;
  double? cartno;
  String? transporterCode;
  String? oldTransporterCode;
  String? transporter;
  String? transporterName;
  String? vehicleType;
  String? harvesterCode;
  String? harvesterName;
  String? harvestingCodeHt;
  String? harvesterCodeOld;
  String? harvesterCodeH;
  String? harvesterNameH;
  String? gangType;
  String? vehicleNumber;
  String? tolly1;
  String? tolly2;
  String? rope;
  String? waterSupplier;
  String? waterSupplierName;
  double? waterShare;
  double? percentage;
  String? slipBoy;
  int? canSlipFlag;
  String? circleOffice;
  String? vendorCode;
  int? basPaliFlag;
  String? doctype;

  Tripsheet(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.tripsheetNo,
        this.date,
        this.slipNo,
        this.season,
        this.branch,
        this.plotNo,
        this.platNoId,
        this.farmerCode,
        this.farmerName,
        this.fieldVillage,
        this.caneVariety,
        this.plantationDate,
        this.surveryNo,
        this.areaAcre,
        this.routeName,
        this.distance,
        this.burnCane,
        this.deduction,
        this.cartno,
        this.transporterCode,
        this.oldTransporterCode,
        this.transporter,
        this.transporterName,
        this.vehicleType,
        this.harvesterCode,
        this.harvesterName,
        this.harvestingCodeHt,
        this.harvesterCodeOld,
        this.harvesterCodeH,
        this.harvesterNameH,
        this.gangType,
        this.vehicleNumber,
        this.tolly1,
        this.tolly2,
        this.rope,
        this.waterSupplier,
        this.waterSupplierName,
        this.waterShare,
        this.percentage,
        this.slipBoy,
        this.canSlipFlag,
        this.circleOffice,
        this.vendorCode,
        this.basPaliFlag,
        this.doctype});

  Tripsheet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    tripsheetNo = json['tripsheet_no'];
    date = json['date'];
    slipNo = json['slip_no'];
    season = json['season'];
    branch = json['branch'];
    plotNo = json['plot_no'];
    platNoId = json['plat_no_id'];
    farmerCode = json['farmer_code'];
    farmerName = json['farmer_name'];
    fieldVillage = json['field_village'];
    caneVariety = json['cane_variety'];
    plantationDate = json['plantation_date'];
    surveryNo = json['survery_no'];
    areaAcre = json['area_acre'];
    routeName = json['route_name'];
    distance = json['distance'];
    burnCane = json['burn_cane'];
    deduction = json['deduction'];
    cartno = json['cartno'];
    transporterCode = json['transporter_code'];
    oldTransporterCode = json['old_transporter_code'];
    transporter = json['transporter'];
    transporterName = json['transporter_name'];
    vehicleType = json['vehicle_type'];
    harvesterCode = json['harvester_code'];
    harvesterName = json['harvester_name'];
    harvestingCodeHt = json['harvesting_code__ht'];
    harvesterCodeOld = json['harvester_code_old'];
    harvesterCodeH = json['harvester_code_h'];
    harvesterNameH = json['harvester_name_h'];
    gangType = json['gang_type'];
    vehicleNumber = json['vehicle_number'];
    tolly1 = json['tolly_1'];
    tolly2 = json['tolly_2'];
    rope = json['rope'];
    waterSupplier = json['water_supplier'];
    waterSupplierName = json['water_supplier_name'];
    waterShare = json['water_share'];
    percentage = json['percentage'];
    slipBoy = json['slip_boy'];
    canSlipFlag = json['can_slip_flag'];
    circleOffice = json['circle_office'];
    vendorCode = json['vendor_code'];
    basPaliFlag = json['bas_pali_flag'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['tripsheet_no'] = this.tripsheetNo;
    data['date'] = this.date;
    data['slip_no'] = this.slipNo;
    data['season'] = this.season;
    data['branch'] = this.branch;
    data['plot_no'] = this.plotNo;
    data['plat_no_id'] = this.platNoId;
    data['farmer_code'] = this.farmerCode;
    data['farmer_name'] = this.farmerName;
    data['field_village'] = this.fieldVillage;
    data['cane_variety'] = this.caneVariety;
    data['plantation_date'] = this.plantationDate;
    data['survery_no'] = this.surveryNo;
    data['area_acre'] = this.areaAcre;
    data['route_name'] = this.routeName;
    data['distance'] = this.distance;
    data['burn_cane'] = this.burnCane;
    data['deduction'] = this.deduction;
    data['cartno'] = this.cartno;
    data['transporter_code'] = this.transporterCode;
    data['old_transporter_code'] = this.oldTransporterCode;
    data['transporter'] = this.transporter;
    data['transporter_name'] = this.transporterName;
    data['vehicle_type'] = this.vehicleType;
    data['harvester_code'] = this.harvesterCode;
    data['harvester_name'] = this.harvesterName;
    data['harvesting_code__ht'] = this.harvestingCodeHt;
    data['harvester_code_old'] = this.harvesterCodeOld;
    data['harvester_code_h'] = this.harvesterCodeH;
    data['harvester_name_h'] = this.harvesterNameH;
    data['gang_type'] = this.gangType;
    data['vehicle_number'] = this.vehicleNumber;
    data['tolly_1'] = this.tolly1;
    data['tolly_2'] = this.tolly2;
    data['rope'] = this.rope;
    data['water_supplier'] = this.waterSupplier;
    data['water_supplier_name'] = this.waterSupplierName;
    data['water_share'] = this.waterShare;
    data['percentage'] = this.percentage;
    data['slip_boy'] = this.slipBoy;
    data['can_slip_flag'] = this.canSlipFlag;
    data['circle_office'] = this.circleOffice;
    data['vendor_code'] = this.vendorCode;
    data['bas_pali_flag'] = this.basPaliFlag;
    data['doctype'] = this.doctype;
    return data;
  }
}
