import 'package:flutter/material.dart';
import 'package:user_management/pages/add_user.dart';
import 'package:user_management/user_service.dart';

import '../user_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> _userList=<User>[];
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
    print("Fetched USer");

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }
  _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  deleteDataDialog(BuildContext context,userId){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        title: Text("Are you sure to delete it?"),
        actions: [
          ElevatedButton(onPressed: () async{
            var result = await _userService.deleteUser(userId);
            if(result!=null){
              Navigator.pop(context);
              getAllUsers();
              _showSnackBar("User has been deleted");
            }
          }, child: Text("Delete",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.purple,

          ),),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.purple,

              ))

        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
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
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                IconButton(onPressed: (){
                  deleteDataDialog(context, _userList[index].id);
                }, icon: Icon(Icons.delete))
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddUser()));
      }),
    );
  }
}
