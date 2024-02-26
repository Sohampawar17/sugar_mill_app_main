class FarmersListModel {
  String? supplierName;
  String? village;
  String? name;
  String? workflowState;
  String? circleOffice;
  String? existingSupplierCode;

  FarmersListModel(
      {this.supplierName,
      this.village,
      this.name,
      this.workflowState,
      this.circleOffice,
      this.existingSupplierCode});

  FarmersListModel.fromJson(Map<String, dynamic> json) {
    supplierName = json['supplier_name'];
    village = json['village'];
    name = json['name'];
    workflowState = json['workflow_state'];
    circleOffice = json['circle_office'];
    existingSupplierCode = json['existing_supplier_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supplier_name'] = supplierName;
    data['village'] = village;
    data['name'] = name;
    data['workflow_state'] = workflowState;
    data['circle_office'] = circleOffice;
    data['existing_supplier_code'] = existingSupplierCode;
    return data;
  }
}
