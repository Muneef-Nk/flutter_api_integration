class Employee {
  String? status;
  List<EmployeeElement>? employees;
  int? totalResults;

  Employee({
    this.status,
    this.employees,
    this.totalResults,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        status: json["status"],
        employees: json["employees"] == null
            ? []
            : List<EmployeeElement>.from(
                json["employees"]!.map((x) => EmployeeElement.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "employees": employees == null
            ? []
            : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class EmployeeElement {
  String? id;
  String? employeeName;
  String? designation;

  EmployeeElement({
    this.id,
    this.employeeName,
    this.designation,
  });

  factory EmployeeElement.fromJson(Map<String, dynamic> json) =>
      EmployeeElement(
        id: json["id"],
        employeeName: json["employee_name"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "designation": designation,
      };
}
