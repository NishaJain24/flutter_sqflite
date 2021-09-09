import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Sqlite Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: () async {

              int i= await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName : 'Nisha',
              });
              print('The inserted id is $i');

            }, child: Text('Insert'),
            color: Colors.yellow,),
            FlatButton(onPressed: () async{
              List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);

            }, child: Text('Query'),
              color: Colors.orange,),
            FlatButton(onPressed: () async{
              int updateId= await DatabaseHelper.instance.update({
                DatabaseHelper.columnId: 2,
                DatabaseHelper.columnName : 'Jain'
              });
              print(updateId);

            }, child: Text('Update'),
              color: Colors.blue,),
            FlatButton(onPressed: () async{
              int rowDelete = await DatabaseHelper.instance.delete(2);
              print(rowDelete);

            }, child: Text('Delete'),
              color: Colors.green,),

          ],
        ),
      )
    );
  }
}
