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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['standard_rate'] = standardRate;
    return data;
  }
}
