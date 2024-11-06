import 'package:flutter/material.dart';
import 'package:user_management/user_service.dart';

import '../user_model.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _userService = UserService();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing user data
    nameController.text = widget.user.name ?? "";
    contactController.text = widget.user.contact ?? "";
    descriptionController.text = widget.user.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(controller: nameController,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your name";
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Name",
                    labelText: "Name"
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                controller: contactController,
                validator: (value){
                  if (value!.isEmpty){
                    return "Please enter your Contact";
                  }
                  if(!RegExp("[0-9]+").hasMatch(value) || value!.length !=10){
                    return "Please enter a Valid Contact";
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Contact",
                    labelText: "Contact"
                ),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Contact";
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Description",
                    labelText: "Description"
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        updateData();
                      });
                    }

                  }, child: Text("Save")),
                  SizedBox(width: 20.0,),
                  ElevatedButton(onPressed: (){
                  }, child: Text("Reset")),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Future updateData() async {
    var _user = User();
    _user.id = widget.user.id;
    _user.name = nameController.text;
    _user.contact = contactController.text;
    _user.description = descriptionController.text;

    var result = await _userService.updateUser(_user);
    Navigator.pop(context, result);
    print("user Updated!");
  }
}

