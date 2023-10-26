import 'dart:convert';

import 'package:api_integration/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeController with ChangeNotifier {
  Employee? api;

  // C R U D

  //get data from server
  fetchEmployee() async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/";
    final response = await http.get(Uri.parse(baseurl));
    var responseData = jsonDecode(response.body);
    api = Employee.fromJson(responseData);
    notifyListeners();
  }

  //add data to server
  addEmployee({required String title, required String subtitle}) async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/";
    await http.post(Uri.parse(baseurl),
        body: {"employee_name": title, "designation": subtitle});
    fetchEmployee();

    notifyListeners();
  }

  //delete data from server
  deleteEmployee({required String id}) async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/$id/";
    await http.delete(Uri.parse(baseurl));
    fetchEmployee();
    notifyListeners();
  }

  //edit data from server
  editEmployee({required String title, required String subtitle}) async {
    final baseurl = "http://3.92.68.133:8000/api/addemployee/addemployee/";
    await http.put(Uri.parse(baseurl),
        body: {"employee_name": title, "designation": subtitle});
    fetchEmployee();
    notifyListeners();
  }
}
