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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['baselqty'] = this.baselqty;
    data['preearthqty'] = this.preearthqty;
    data['earthingqty'] = this.earthingqty;
    data['rainyqty'] = this.rainyqty;
    data['ratoon_1qty'] = this.ratoon1qty;
    data['ratoon_2qty'] = this.ratoon2qty;
    data['qty'] = this.qty;
    data['item_tax_temp'] = this.itemTaxTemp;
    data['actual_qty'] = this.actualQty;
    data['tax_number'] = this.taxNumber;
    data['rate'] = this.rate;
    data['weight_per_unit'] = this.weightPerUnit;
    return data;
  }
}
