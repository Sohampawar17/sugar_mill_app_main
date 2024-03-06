class WaterSupplierList {
  String? name;
  String? supplierName;
  String? existingSupplierCode;

  WaterSupplierList({this.name, this.supplierName, this.existingSupplierCode});

  WaterSupplierList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    supplierName = json['supplier_name'];
    existingSupplierCode = json['existing_supplier_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['supplier_name'] = supplierName;
    data['existing_supplier_code'] = existingSupplierCode;
    return data;
  }
}
