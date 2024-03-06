class SupplierList {
  String? name;
  String? supplierName;

  SupplierList({this.name, this.supplierName});

  SupplierList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    supplierName = json['supplier_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['supplier_name'] = supplierName;
    return data;
  }
}
