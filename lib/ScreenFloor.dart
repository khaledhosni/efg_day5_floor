import 'dart:math';

import 'package:efg_day5_floor/AppDatabase.dart';
import 'package:efg_day5_floor/model/Person.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(onPressed: ()async{

                  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

                  var personDao=database.personDao;
                  var id=Random().nextInt(100000);
                  var person=Person(id, "Person $id");
                  personDao.insertPerson(person);



                }, child: Text("Add Person")),
                ElevatedButton(onPressed: (){}, child: Text("Get Person")),
                ElevatedButton(onPressed: ()async{

                  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

                  var personDao=database.personDao;

                 var persons=await personDao.findAllPersons();

                 persons.forEach((p) {
                   print('${p.name}   ${p.id}');
                 });

                }, child: Text("Show All Persons")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
