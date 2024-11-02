import 'package:flutter/material.dart';
class ViewUser extends StatefulWidget {
  const ViewUser({super.key});

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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
        Text("Id"),
            Text("Name"),
            Text("Contact"),
            Text("Descriptop "),
          ],
        ),
      ),
    );
  }
}
