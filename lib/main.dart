import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:keboen_coding_pertemuan3/src/models/users_models_hive.dart';

import 'package:keboen_coding_pertemuan3/src/view/list_user.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());


Future _openBox() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  return await Hive.openBox('usersBox');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    Hive.registerAdapter(UsersModelsHiveAdapter(), 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _openBox(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return Scaffold(
                body: Center(
                  child: Text('Soomething Wrong...'),
                ),
              );
            } else {
              return ListUsers();
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
