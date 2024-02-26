class Employee {
  String? employeeName;
  String? name;

  Employee({this.employeeName, this.name});

  Employee.fromJson(Map<String, dynamic> json) {
    employeeName = json['employee_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_name'] = this.employeeName;
    data['name'] = this.name;
    return data;
  }
}
