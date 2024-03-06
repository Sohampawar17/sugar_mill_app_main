class FertilizerItemList {
  String? name;
  String? itemName;
  String? itemCode;
  double? weightPerUnit;
  String? itemTaxTemp;
  double? taxNumber;
  String? actualQty;
  double? rate;

  FertilizerItemList(
      {this.name,
        this.itemName,
        this.itemCode,
        this.weightPerUnit,
        this.itemTaxTemp,
        this.taxNumber,
        this.actualQty,
        this.rate});

  FertilizerItemList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    weightPerUnit = json['weight_per_unit'];
    itemTaxTemp = json['item_tax_temp'];
    taxNumber = json['tax_number'];
    actualQty = json['actual_qty'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['item_name'] = itemName;
    data['item_code'] = itemCode;
    data['weight_per_unit'] = weightPerUnit;
    data['item_tax_temp'] = itemTaxTemp;
    data['tax_number'] = taxNumber;
    data['actual_qty'] = actualQty;
    data['rate'] = rate;
    return data;
  }
}
