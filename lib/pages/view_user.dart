import 'package:flutter/material.dart';

import '../user_model.dart';
class ViewUser extends StatefulWidget {
  final User user;
  const ViewUser({super.key, required this.user});

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View User"),
      ),
      body: Card(
        margin: EdgeInsets.all(15.0),
        elevation: 20,
        color: Colors.purpleAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: SizedBox(
            height: 165,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                Text("Id:",style: _userStyle(),),
                    Text("Name:",style: _userStyle()),
                    Text("Contact:",style: _userStyle()),
                    Text("Descriptop:",style: _userStyle()),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    Text(widget.user.id.toString(),style: _userStyle()),
                    Text(widget.user.name.toString(),style: _userStyle()),
                    Text(widget.user.contact.toString(),style: _userStyle()),
                    Text(widget.user.description.toString(),style: _userStyle()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  TextStyle _userStyle(){
    return TextStyle(fontSize:16,fontWeight: FontWeight.bold);
  }
}
