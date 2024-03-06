class DoseTypeModel {
  String? itemCode;
  String? itemName;
  double? baselqty;
  double? preearthqty;
  double? earthingqty;
  double? rainyqty;
  double? ratoon1qty;
  double? ratoon2qty;
  double? qty;
  String? itemTaxTemp;
  String? actualQty;
  double? taxNumber;
  double? rate;
  double? weightPerUnit;

  DoseTypeModel(
      {this.itemCode,
        this.itemName,
        this.baselqty,
        this.preearthqty,
        this.earthingqty,
        this.rainyqty,
        this.ratoon1qty,
        this.ratoon2qty,
        this.qty,
        this.itemTaxTemp,
        this.actualQty,
        this.taxNumber,
        this.rate,
        this.weightPerUnit});

  DoseTypeModel.fromJson(Map<String, dynamic> json) {
    itemCode = json['item_code'];
    itemName = json['item_name'];
    baselqty = json['baselqty'];
    preearthqty = json['preearthqty'];
    earthingqty = json['earthingqty'];
    rainyqty = json['rainyqty'];
    ratoon1qty = json['ratoon_1qty'];
    ratoon2qty = json['ratoon_2qty'];
    qty = json['qty'];
    itemTaxTemp = json['item_tax_temp'];
    actualQty = json['actual_qty'];
    taxNumber = json['tax_number'];
    rate = json['rate'];
    weightPerUnit = json['weight_per_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['baselqty'] = baselqty;
    data['preearthqty'] = preearthqty;
    data['earthingqty'] = earthingqty;
    data['rainyqty'] = rainyqty;
    data['ratoon_1qty'] = ratoon1qty;
    data['ratoon_2qty'] = ratoon2qty;
    data['qty'] = qty;
    data['item_tax_temp'] = itemTaxTemp;
    data['actual_qty'] = actualQty;
    data['tax_number'] = taxNumber;
    data['rate'] = rate;
    data['weight_per_unit'] = weightPerUnit;
    return data;
  }
}
