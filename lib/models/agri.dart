class Agri {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? salesType;
  String? season;
  String? caneRegistrationId;
  String? supplier;
  String? vendorCode;
  String? growerName;
  String? nurserySupplier;
  String? supplierName;
  String? branch;
  String? village;
  String? cropType;
  String? cropVariety;
  String? date;
  double? area;
  double? developmentArea;
  String? route;
  int? basel;
  int? preEarthing;
  int? earth;
  int? rainy;
  int? ratoon1;
  int? ratoon2;
  double? total;
  double? baselTotal;
  double? preEarthingTotal;
  double? earthTotal;
  double? rainyTotal;
  double? ratoon1Total;
  double? ratoon2Total;
  double? totalWeight;
  double? totalGstAmount;
  double? totalBaseAmount;
  double? totalAmount;
  String? creatorName;
  String? doctype;
  List<AgricultureDevelopmentItem>? agricultureDevelopmentItem;
  List<AgricultureDevelopmentItem2>? agricultureDevelopmentItem2;
  List<Grantor>? grantor;

  Agri(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.salesType,
        this.season,
        this.caneRegistrationId,
        this.supplier,
        this.vendorCode,
        this.growerName,
        this.nurserySupplier,
        this.supplierName,
        this.branch,
        this.village,
        this.cropType,
        this.cropVariety,
        this.date,
        this.area,
        this.developmentArea,
        this.route,
        this.basel,
        this.preEarthing,
        this.earth,
        this.rainy,
        this.ratoon1,
        this.ratoon2,
        this.total,
        this.baselTotal,
        this.preEarthingTotal,
        this.earthTotal,
        this.rainyTotal,
        this.ratoon1Total,
        this.ratoon2Total,
        this.totalWeight,
        this.totalGstAmount,
        this.totalBaseAmount,
        this.totalAmount,
        this.creatorName,
        this.doctype,
        this.agricultureDevelopmentItem,
        this.agricultureDevelopmentItem2,
        this.grantor});

  Agri.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    salesType = json['sales_type'];
    season = json['season'];
    caneRegistrationId = json['cane_registration_id'];
    supplier = json['supplier'];
    vendorCode = json['vendor_code'];
    growerName = json['grower_name'];
    nurserySupplier = json['nursery_supplier'];
    supplierName = json['supplier_name'];
    branch = json['branch'];
    village = json['village'];
    cropType = json['crop_type'];
    cropVariety = json['crop_variety'];
    date = json['date'];
    area = json['area'];
    developmentArea = json['development_area'];
    route = json['route'];
    basel = json['basel'];
    preEarthing = json['pre_earthing'];
    earth = json['earth'];
    rainy = json['rainy'];
    ratoon1 = json['ratoon_1'];
    ratoon2 = json['ratoon_2'];
    total = json['total'];
    baselTotal = json['basel_total'];
    preEarthingTotal = json['pre_earthing_total'];
    earthTotal = json['earth_total'];
    rainyTotal = json['rainy_total'];
    ratoon1Total = json['ratoon_1_total'];
    ratoon2Total = json['ratoon_2_total'];
    totalWeight=json['total_weight'];
    totalGstAmount=json['total_gst_amount'];
    totalBaseAmount=json['total_base_amount'];
    totalAmount=json['total_amount'];
    creatorName = json['creator_name'];
    doctype = json['doctype'];
    if (json['agriculture_development_item'] != null) {
      agricultureDevelopmentItem = <AgricultureDevelopmentItem>[];
      json['agriculture_development_item'].forEach((v) {
        agricultureDevelopmentItem!
            .add( AgricultureDevelopmentItem.fromJson(v));
      });
    }
    if (json['agriculture_development_item2'] != null) {
      agricultureDevelopmentItem2 = <AgricultureDevelopmentItem2>[];
      json['agriculture_development_item2'].forEach((v) {
        agricultureDevelopmentItem2!
            .add( AgricultureDevelopmentItem2.fromJson(v));
      });
    }
    if (json['grantor'] != null) {
      grantor = <Grantor>[];
      json['grantor'].forEach((v) {
        grantor!.add( Grantor.fromJson(v));
      });
    }
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
    data['sales_type'] = salesType;
    data['season'] = season;
    data['cane_registration_id'] = caneRegistrationId;
    data['supplier'] = supplier;
    data['vendor_code'] = vendorCode;
    data['grower_name'] = growerName;
    data['nursery_supplier'] = nurserySupplier;
    data['supplier_name'] = supplierName;
    data['branch'] = branch;
    data['village'] = village;
    data['crop_type'] = cropType;
    data['crop_variety'] = cropVariety;
    data['date'] = date;
    data['area'] = area;
    data['development_area'] = developmentArea;
    data['route'] = route;
    data['basel'] = basel;
    data['pre_earthing'] = preEarthing;
    data['earth'] = earth;
    data['rainy'] = rainy;
    data['ratoon_1'] = ratoon1;
    data['ratoon_2'] = ratoon2;
    data['total'] = total;
    data['basel_total'] = baselTotal;
    data['pre_earthing_total'] = preEarthingTotal;
    data['earth_total'] = earthTotal;
    data['rainy_total'] = rainyTotal;
    data['ratoon_1_total'] = ratoon1Total;
    data['ratoon_2_total'] = ratoon2Total;
    data['total_weight']=totalWeight;
    data['total_gst_amount']=totalGstAmount;
    data['total_base_amount']=totalBaseAmount;
    data['total_amount']=totalAmount;
    data['creator_name'] = creatorName;
    data['doctype'] = doctype;
    if (agricultureDevelopmentItem != null) {
      data['agriculture_development_item'] =
          agricultureDevelopmentItem!.map((v) => v.toJson()).toList();
    }
    if (agricultureDevelopmentItem2 != null) {
      data['agriculture_development_item2'] =
          agricultureDevelopmentItem2!.map((v) => v.toJson()).toList();
    }
    if (grantor != null) {
      data['grantor'] = grantor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgricultureDevelopmentItem {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? itemCode;
  String? itemName;
  double? basel;
  double? preEarthing;
  double? earth;
  double? rainy;
  double? ratoon1;
  double? ratoon2;
  double? qty;
  String? description;
  String? stockUom;
  String? actualQty;
  double? rate;
  String? itemTaxTemp;
  double? weightPerUnit;
  double? totalWeight;
  String? weightUom;
  double? baseAmount;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;

  AgricultureDevelopmentItem(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.itemCode,
        this.itemName,
        this.basel,
        this.preEarthing,
        this.earth,
        this.rainy,
        this.ratoon1,
        this.ratoon2,
        this.qty,
        this.description,
        this.stockUom,
        this.actualQty,
        this.rate,
        this.itemTaxTemp,
        this.weightPerUnit,
        this.totalWeight,
        this.weightUom,
        this.baseAmount,
        this.parent,
        this.parentfield,
        this.parenttype,
        this.doctype});

  AgricultureDevelopmentItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    basel = json['basel'];
    preEarthing = json['pre_earthing'];
    earth = json['earth'];
    rainy = json['rainy'];
    ratoon1 = json['ratoon_1'];
    ratoon2 = json['ratoon_2'];
    qty = json['qty'];
    description = json['description'];
    stockUom = json['stock_uom'];
    actualQty = json['actual_qty'];
    rate = json['rate'];
    itemTaxTemp = json['item_tax_temp'];
    weightPerUnit = json['weight_per_unit'];
    totalWeight=json['total_weight'];
    weightUom = json['weight_uom'];
    baseAmount = json['base_amount'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
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
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['basel'] = basel;
    data['pre_earthing'] = preEarthing;
    data['earth'] = earth;
    data['rainy'] = rainy;
    data['ratoon_1'] = ratoon1;
    data['ratoon_2'] = ratoon2;
    data['qty'] = qty;
    data['description'] = description;
    data['stock_uom'] = stockUom;
    data['actual_qty'] = actualQty;
    data['rate'] = rate;
    data['item_tax_temp'] = itemTaxTemp;
    data['weight_per_unit'] = weightPerUnit;
    data['total_weight']=totalWeight;
    data['weight_uom'] = weightUom;
    data['base_amount'] = baseAmount;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['doctype'] = doctype;
    return data;
  }
}

class AgricultureDevelopmentItem2 {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? itemCode;
  String? itemName;
  double? qty;
  double? rate;
  String? stockUom;
  String? description;
  double? amount;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;

  AgricultureDevelopmentItem2(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.itemCode,
        this.itemName,
        this.qty,
        this.rate,
        this.stockUom,
        this.description,
        this.amount,
        this.parent,
        this.parentfield,
        this.parenttype,
        this.doctype});

  AgricultureDevelopmentItem2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    qty = json['qty'];
    rate = json['rate'];
    stockUom = json['stock_uom'];
    description = json['description'];
    amount = json['amount'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
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
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['qty'] = qty;
    data['rate'] = rate;
    data['stock_uom'] = stockUom;
    data['description'] = description;
    data['amount'] = amount;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['doctype'] = doctype;
    return data;
  }
}

class Grantor {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? suretyCode;
  String? suretyName;
  String? suretyExistingCode;
  String? village;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;

  Grantor(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.suretyCode,
        this.suretyName,
        this.suretyExistingCode,
        this.village,
        this.parent,
        this.parentfield,
        this.parenttype,
        this.doctype});

  Grantor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    suretyCode = json['surety_code'];
    suretyName = json['surety_name'];
    suretyExistingCode = json['surety_existing_code'];
    village = json['village'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
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
    data['surety_code'] = suretyCode;
    data['surety_name'] = suretyName;
    data['surety_existing_code'] = suretyExistingCode;
    data['village'] = village;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['doctype'] = doctype;
    return data;
  }
}
