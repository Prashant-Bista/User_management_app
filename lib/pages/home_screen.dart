import 'package:flutter/material.dart';
import 'package:user_management/user_service.dart';

import '../user_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> _userList;
  final _userService = UserService();
  getAllUsers() async{
    var users = await _userService.readAllUsersData();
    _userList = <User>[];
    users.forEach((user){
      setState(() {
        var userModel = User();
        userModel.id= user['id'];
        userModel.name= user['name'];
        userModel.contact= user['contact'];
        userModel.description= user['description'];
        _userList.add(userModel);
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Management App"),
      ),
      body: ListView.builder(itemCount:_userList.length,itemBuilder: (context, index){
        return ListTile(
          onTap: (){},
          leading: Icon(Icons.person),
          title: Text(_userList[index].name??""),
          subtitle: Text(_userList[index].name??""),
          trailing: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete))
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){

      }),
    );
  }
}
