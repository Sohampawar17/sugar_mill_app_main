class Item {
  String? itemCode;
  String? itemName;
  double? standardRate;

  Item({this.itemCode, this.itemName, this.standardRate});

  Item.fromJson(Map<String, dynamic> json) {
    itemCode = json['item_code'];
    itemName = json['item_name'];
    standardRate = json['standard_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['standard_rate'] = this.standardRate;
    return data;
  }
}
