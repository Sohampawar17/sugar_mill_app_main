class samplingformula {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  String? idx;
  String? minimumBrix;
  String? maximumBrix;
  String? minimumPairs;
  String? maximumPairs;
  String? doctype;

  samplingformula(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.minimumBrix,
      this.maximumBrix,
      this.minimumPairs,
      this.maximumPairs,
      this.doctype});

  samplingformula.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    minimumBrix = json['minimum_brix'];
    maximumBrix = json['maximum_brix'];
    minimumPairs = json['minimum_pairs'];
    maximumPairs = json['maximum_pairs'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['minimum_brix'] = minimumBrix;
    data['maximum_brix'] = maximumBrix;
    data['minimum_pairs'] = minimumPairs;
    data['maximum_pairs'] = maximumPairs;
    data['doctype'] = doctype;
    return data;
  }
}
