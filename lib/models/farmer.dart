class Farmer {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? workflowState;
  String? namingSeries;
  String? supplierName;
  String? supplierType;
  String? branch;
  String? aadhaarNumber;
  String? panNumber;
  String? mobileNumber;
  String? dateOfBirth;
  String? existingSupplierCode;
  String? gender;
  String? age;
  String? country;
  String? supplierGroup;
  int? isTransporter;
  int? isHarvester;
  int? isFarmer;
  int? isMember;
  int? drip;
  int? nursery;
  String? village;
  String? circleOffice;
  String? taluka;
  int? readOnlyCount;
  String? state;
  String? aadhaarCard;
  String? panCard;
  String? consentLetter;
  int? isInternalSupplier;
  String? language;
  int? allowPurchaseInvoiceCreationWithoutPurchaseOrder;
  int? allowPurchaseInvoiceCreationWithoutPurchaseReceipt;
  int? isFrozen;
  int? disabled;
  int? warnRfqs;
  int? warnPos;
  int? preventRfqs;
  int? preventPos;
  int? onHold;
  String? holdType;
  String? doctype;
  List<BankDetails>? bankDetails;

  Farmer(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.workflowState,
      this.namingSeries,
      this.supplierName,
      this.supplierType,
      this.branch,
      this.aadhaarNumber,
        this.panNumber,
      this.mobileNumber,
      this.dateOfBirth,
      this.existingSupplierCode,
      this.gender,
      this.age,
      this.country,
      this.supplierGroup,
      this.isTransporter,
      this.isHarvester,
      this.isFarmer,
      this.isMember,
      this.readOnlyCount,
        this.drip,
        this.nursery,
      this.village,
      this.circleOffice,
      this.taluka,
      this.state,
      this.aadhaarCard,
        this.panCard,
      this.consentLetter,
      this.isInternalSupplier,
      this.language,
      this.allowPurchaseInvoiceCreationWithoutPurchaseOrder,
      this.allowPurchaseInvoiceCreationWithoutPurchaseReceipt,
      this.isFrozen,
      this.disabled,
      this.warnRfqs,
      this.warnPos,
      this.preventRfqs,
      this.preventPos,
      this.onHold,
      this.holdType,
      this.doctype,
      this.bankDetails});

  Farmer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    workflowState = json['workflow_state'];
    namingSeries = json['naming_series'];
    supplierName = json['supplier_name'];
    supplierType = json['supplier_type'];
    branch = json['branch'];
    aadhaarNumber = json['aadhaar_number'];
    panNumber=json['pan_number'];
    mobileNumber = json['mobile_number'];
    dateOfBirth = json['date_of_birth'];
    existingSupplierCode = json['existing_supplier_code'];
    gender = json['gender'];
    age = json['age'];
    country = json['country'];
    readOnlyCount=json['read_only_count'];
    supplierGroup = json['supplier_group'];
    isTransporter = json['is_transporter'];
    isHarvester = json['is_harvester'];
    isFarmer = json['is_farmer'];
    isMember = json['is_member'];
    drip=json['drip'];
    nursery=json['nursery'];
    village = json['village'];
    circleOffice = json['circle_office'];
    taluka = json['taluka'];
    state = json['state'];
    aadhaarCard = json['aadhaar_card'];
    panCard=json['pan_card'];
    consentLetter = json['consent_letter'];
    isInternalSupplier = json['is_internal_supplier'];
    language = json['language'];
    allowPurchaseInvoiceCreationWithoutPurchaseOrder =
        json['allow_purchase_invoice_creation_without_purchase_order'];
    allowPurchaseInvoiceCreationWithoutPurchaseReceipt =
        json['allow_purchase_invoice_creation_without_purchase_receipt'];
    isFrozen = json['is_frozen'];
    disabled = json['disabled'];
    warnRfqs = json['warn_rfqs'];
    warnPos = json['warn_pos'];
    preventRfqs = json['prevent_rfqs'];
    preventPos = json['prevent_pos'];
    onHold = json['on_hold'];
    holdType = json['hold_type'];
    doctype = json['doctype'];
    if (json['bank_details'] != null) {
      bankDetails = <BankDetails>[];
      json['bank_details'].forEach((v) {
        bankDetails!.add(BankDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['workflow_state'] = workflowState;
    data['naming_series'] = namingSeries;
    data['supplier_name'] = supplierName;
    data['supplier_type'] = supplierType;
    data['branch'] = branch;
    data['aadhaar_number'] = aadhaarNumber;
    data['pan_number']=panNumber;
    data['mobile_number'] = mobileNumber;
    data['date_of_birth'] = dateOfBirth;
    data['existing_supplier_code'] = existingSupplierCode;
    data['gender'] = gender;
    data['age'] = age;
    data['read_only_count']=readOnlyCount;
    data['country'] = country;
    data['supplier_group'] = supplierGroup;
    data['is_transporter'] = isTransporter;
    data['is_harvester'] = isHarvester;
    data['is_farmer'] = isFarmer;
    data['is_member'] = isMember;
    data['drip']=drip;
    data['nursery']=nursery;
    data['village'] = village;
    data['circle_office'] = circleOffice;
    data['taluka'] = taluka;
    data['state'] = state;
    data['aadhaar_card'] = aadhaarCard;
    data['pan_card']=panCard;
    data['consent_letter'] = consentLetter;
    data['is_internal_supplier'] = isInternalSupplier;
    data['language'] = language;
    data['allow_purchase_invoice_creation_without_purchase_order'] =
        allowPurchaseInvoiceCreationWithoutPurchaseOrder;
    data['allow_purchase_invoice_creation_without_purchase_receipt'] =
        allowPurchaseInvoiceCreationWithoutPurchaseReceipt;
    data['is_frozen'] = isFrozen;
    data['disabled'] = disabled;
    data['warn_rfqs'] = warnRfqs;
    data['warn_pos'] = warnPos;
    data['prevent_rfqs'] = preventRfqs;
    data['prevent_pos'] = preventPos;
    data['on_hold'] = onHold;
    data['hold_type'] = holdType;
    data['doctype'] = doctype;
    if (bankDetails != null) {
      data['bank_details'] = bankDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class BankDetails {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  int? farmer;
  int? harvester;
  int? transporter;
  int? drip;
  int? nursery;
  String? bankName;
  String? branchifscCode;
  String? accountNumber;
  String? status;
  String? isActive;
  String? createdDatename;
  String? bankAndBranch;
  String? bankPassbook;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;

  BankDetails(
      {this.name,
        this.owner,
        this.creation,
        this.modified,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.farmer,
        this.harvester,
        this.transporter,
        this.drip,
        this.nursery,
        this.bankName,
        this.branchifscCode,
        this.accountNumber,
        this.status,
        this.isActive,
        this.createdDatename,
        this.bankAndBranch,
        this.bankPassbook,
        this.parent,
        this.parentfield,
        this.parenttype,
        this.doctype});

  BankDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    farmer = json['farmer'];
    harvester = json['harvester'];
    transporter = json['transporter'];
    drip = json['drip'];
    nursery = json['nursery'];
    bankName = json['bank_name'];
    branchifscCode = json['branchifsc_code'];
    accountNumber = json['account_number'];
    status = json['status'];
    isActive = json['is_active'];
    createdDatename = json['created_datename'];
    bankAndBranch = json['bank_and_branch'];
    bankPassbook = json['bank_passbook'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['farmer'] = farmer;
    data['harvester'] = harvester;
    data['transporter'] = transporter;
    data['drip'] = drip;
    data['nursery'] = nursery;
    data['bank_name'] = bankName;
    data['branchifsc_code'] = branchifscCode;
    data['account_number'] = accountNumber;
    data['status'] = status;
    data['is_active'] = isActive;
    data['created_datename'] = createdDatename;
    data['bank_and_branch'] = bankAndBranch;
    data['bank_passbook'] = bankPassbook;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['doctype'] = doctype;
    return data;
  }
}


