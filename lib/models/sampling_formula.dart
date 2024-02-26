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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['minimum_brix'] = this.minimumBrix;
    data['maximum_brix'] = this.maximumBrix;
    data['minimum_pairs'] = this.minimumPairs;
    data['maximum_pairs'] = this.maximumPairs;
    data['doctype'] = this.doctype;
    return data;
  }
}
