class Checkin {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? employee;
  String? employeeName;
  String? logType;
  String? shift;
  String? time;
  String? deviceId;
  int? skipAutoAttendance;
  String? shiftStart;
  String? shiftEnd;
  String? shiftActualStart;
  String? shiftActualEnd;
  String? latitude;
  String? longitude;
  String? doctype;

  Checkin(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.employee,
      this.employeeName,
      this.logType,
      this.shift,
      this.time,
      this.deviceId,
      this.skipAutoAttendance,
      this.shiftStart,
      this.shiftEnd,
      this.shiftActualStart,
      this.shiftActualEnd,
      this.latitude,
      this.longitude,
      this.doctype});

  Checkin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    employee = json['employee'];
    employeeName = json['employee_name'];
    logType = json['log_type'];
    shift = json['shift'];
    time = json['time'];
    deviceId = json['device_id'];
    skipAutoAttendance = json['skip_auto_attendance'];
    shiftStart = json['shift_start'];
    shiftEnd = json['shift_end'];
    shiftActualStart = json['shift_actual_start'];
    shiftActualEnd = json['shift_actual_end'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['owner'] = owner;
    data['modified_by'] = modifiedBy;
    data['docstatus'] = docstatus;
    data['idx'] = idx;
    data['employee'] = employee;
    data['employee_name'] = employeeName;
    data['log_type'] = logType;
    data['shift'] = shift;
    data['time'] = time;
    data['device_id'] = deviceId;
    data['skip_auto_attendance'] = skipAutoAttendance;
    data['shift_start'] = shiftStart;
    data['shift_end'] = shiftEnd;
    data['shift_actual_start'] = shiftActualStart;
    data['shift_actual_end'] = shiftActualEnd;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['doctype'] = doctype;
    return data;
  }
}
