//view

import 'package:api_integration/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<EmployeeController>(context, listen: false).fetchEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeController>(context);
    TextEditingController titleController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();

    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            hintText: "enter", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: subTitleController,
                        decoration: InputDecoration(
                            hintText: "enter", border: OutlineInputBorder()),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Provider.of<EmployeeController>(context,
                                    listen: false)
                                .addEmployee(
                                    title: titleController.text,
                                    subtitle: subTitleController.text);
                            Navigator.of(context).pop();
                          },
                          child: Text("submit"))
                    ]),
                  ),
                );
              });
        }),
        body: ListView.builder(
            itemCount: provider.api?.employees?.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200,
                height: 50,
                child: ListTile(
                  title:
                      Text(provider.api?.employees?[index].employeeName ?? ""),
                  subtitle:
                      Text(provider.api?.employees?[index].designation ?? ""),
                  trailing: Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        TextField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                              hintText: "enter",
                                              border: OutlineInputBorder()),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          controller: subTitleController,
                                          decoration: InputDecoration(
                                              hintText: "enter",
                                              border: OutlineInputBorder()),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Provider.of<EmployeeController>(
                                                      context,
                                                      listen: false)
                                                  .addEmployee(
                                                      title:
                                                          titleController.text,
                                                      subtitle:
                                                          subTitleController
                                                              .text);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("submit"))
                                      ]),
                                    ),
                                  );
                                });

                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text("deleted")));
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<EmployeeController>(context,
                                    listen: false)
                                .deleteEmployee(
                                    id: provider.api?.employees?[index].id ??
                                        "");

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("deleted")));
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
