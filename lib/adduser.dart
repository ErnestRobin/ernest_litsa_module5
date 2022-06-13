import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();

  ref() {}
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController departmentController = TextEditingController();
    TextEditingController coursesController = TextEditingController();

    Future _AddUser() {
      final name = nameController.text;
      final department = departmentController.text;
      final course = coursesController.text;

      final ref = FirebaseFirestore.instance.collection("Users").doc();
      return ref
          .set({
            "Username": name,
            "Department": department,
            "Courses": course,
          })
          .then((value) => log("User added successfully"))
          .catchError((onError) => log(onError));
    }

    return Column(
      children: [
        // Input for user name
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: 'Enter username'),
            )),
        //input for department
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: 'Enter Department'),
            )),
        //input for courses
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: 'Enter courses'),
            )),
        ElevatedButton(
          onPressed: () {
            const AddUser();
          },
          child: null,
        ),
      ],
    );
  }
}
