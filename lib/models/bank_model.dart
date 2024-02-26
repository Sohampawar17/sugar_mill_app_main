class BankMaster {
  String? bankAndBranch;
  String? branch;
  String? ifscCode;

  BankMaster({this.bankAndBranch, this.branch, this.ifscCode});

  BankMaster.fromJson(Map<String, dynamic> json) {
    bankAndBranch = json['bank_and_branch'];
    branch = json['branch'];
    ifscCode = json['ifsc_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_and_branch'] = bankAndBranch;
    data['branch'] = branch;
    data['ifsc_code'] = ifscCode;
    return data;
  }
}
