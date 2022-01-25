import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter_Project",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        // elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed:() {
        //     print("히히");
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart), 
            onPressed: () {
              print("longitude");
            },
          ),
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () {
              print('Search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/image.jpg'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('BBARTO'),
              accountEmail: Text('BBARTO@vadvto.com'),
            ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      //   child: Column(
      //     children: <Widget>[
      //       Center(
      //         child: CircleAvatar(
      //           backgroundImage: AssetImage('assets/image.jpg'),
      //           radius: 60,
      //         ),
      //       ),
            
      //       Text('Hello'),
      //       Text('Hello'),
      //       Text('Hello')
      //     ],
      //   ),
      // ),
      
    );
  }
}