import 'dart:io';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:keboen_coding_pertemuan3/src/database/users_dbhelper.dart';
// import 'package:keboen_coding_pertemuan3/src/models/users_model.dart';
import 'package:keboen_coding_pertemuan3/src/models/users_models_hive.dart';
import 'package:keboen_coding_pertemuan3/src/view/create_users.dart';

class ListUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Users'),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => CreateUsers(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: WatchBoxBuilder(
          box: Hive.box("userSBox"),
          builder: (context, box) {
            var users = box.values.toList().cast<UsersModelsHive>();
            if (users.length != 0) {
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreateUsers(
                                user: users[index],
                              ),
                            )),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                child: ListTile(
                                    leading: users[index].avatar == null
                                        ? FlutterLogo(size: 48.0)
                                        : Image.file(File(users[index].avatar)),
                                    title: Text(users[index].username),
                                    subtitle: Text(users[index].email),
                                    trailing: InkWell(
                                      onTap: () => deleteDB(users[index]),
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      child: Icon(Icons.delete),
                                    )))));
                  });
            } else {
              return Center(
                child: Text("Tidak ada data"),
              );
            }
          }),
    );
  }

  deleteDB(UsersModelsHive user) {
    user.delete();
  }
}
