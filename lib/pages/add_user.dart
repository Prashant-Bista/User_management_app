import 'package:flutter/material.dart';
import 'package:user_management/user_service.dart';

import '../user_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var _userService  = UserService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
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
                       saveData();
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
  Future saveData()async{
    var _user = User();
    _user.name= nameController.text;
    _user.contact= contactController.text;
    _user.description= descriptionController.text;

    var result = await _userService.saveUser(_user);
    Navigator.pop(context,result);
    print("user added");
  }
}
