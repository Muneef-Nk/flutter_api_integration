import 'dart:convert';

import 'package:api_integration/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeController with ChangeNotifier {
  Employee? employeeModel;

  // C R U D

  //get data from server
  fetchEmployee() async {
    final url = Uri.parse("http://3.92.68.133:8000/api/addemployee/");
    final response = await http.get(url);
    var decodedData = jsonDecode(response.body);
    employeeModel = Employee.fromJson(decodedData);
    notifyListeners();
  }

  //add data to server
  addEmployee({required String title, required String subtitle}) async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/";
    final url = Uri.parse(baseurl);
    final response = await http
        .post(url, body: {"employee_name": title, "designation": subtitle});
    if (response.statusCode == 200) {
      print('Successfully posted');
    } else {
      print('failed posted');
    }
    fetchEmployee();

    notifyListeners();
  }

  //delete data from server
  deleteEmployee({required String id}) async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/$id/";
    final response = await http.delete(Uri.parse(baseurl));
    if (response.statusCode == 200) {
      print('Successfully deleted');
      fetchEmployee();
    } else {
      print("Failed to delete employees");
    }
    print(id);
    notifyListeners();
  }

  //update data from server
  Future<void> editEmployee(
      {required String title,
      required String subtitle,
      required String id}) async {
    final url = Uri.parse("http://3.92.68.133:8000/api/addemployee/$id/");
    final response = await http
        .put(url, body: {"employee_name": title, "designation": subtitle});

    print(response);
    if (response.statusCode == 200) {
      print('Successfully deleted');
    }
    fetchEmployee();
    notifyListeners();
  }
}
