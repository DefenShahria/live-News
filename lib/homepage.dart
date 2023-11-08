import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('Daily Day',style: GoogleFonts.adamina(letterSpacing: .6,color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
        elevation: 5,
      ),
      drawer:buildCustomDrawer() ,
      body: Container(),
    );
  }
  Widget buildCustomDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile_image.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle Home item tap
            },
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings item tap
            },
          ),
        ],
      ),
    );
  }
}
