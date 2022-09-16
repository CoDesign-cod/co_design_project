// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import '../shared/components/components.dart';
// import '../shared/components/constants.dart';
//..........................................
// class HomeLayout extends StatefulWidget {
//   const HomeLayout({Key? key}) : super(key: key);
//
//   @override
//   State<HomeLayout> createState() => _HomeLayoutState();
// }
//.........................................
// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database
//....................................................
// class _HomeLayoutState extends State<HomeLayout> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//
//   int currentIndex = 0;
//
//   List<Widget> screens = [
//
//   ];
//
//   List<String> titles = [
//
//   ];
//   late Database database;
//   bool isBottomSheetShown = false;
//   //fab means floating action button
//   IconData fabIcon = Icons.edit;
//
//   @override
//   void initState() {
//     super.initState();
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(
//           titles[currentIndex],
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (isBottomSheetShown) {
//             if (_formKey.currentState!.validate()) {
//               insertToDatabase(
//                 // title: titleController.text,
//                 // date: dateController.text,
//                 // time: timeController.text,
//               ).then((value) {
//                 getDataFromDatabase(database).then((value) {
//                   Navigator.pop(context);
//                   //El setState feh moshkela en hoa beta3 elpage ely ehna feha (home_layout.dart) wehna 3ayzeno y access 3la (new_tasks_screen.dart)
//                   //ya3ny ye3mel setState for (new_tasks_screen.dart)
//                   //dah beyehsal by bloc
//                   setState(() {
//                     isBottomSheetShown = false;
//                     fabIcon = Icons.edit;
//                     tasks = value;
//                   });
//                 });
//               });
//             }
//           } else {
//             _scaffoldKey.currentState!
//                 .showBottomSheet(
//                   (context) => Container(
//                     color: Colors.white,
//                     padding: EdgeInsets.all(20.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           defaultFormField(
//                             label: 'Task title',
//                             controller: titleController,
//                             prefix: Icons.title,
//                             type: TextInputType.text,
//                             validate: (value) {
//                               if (value.isEmpty) {
//                                 return 'Title must not be empty';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           defaultFormField(
//                             onTap: () {
//                               showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               ).then((value) {
//                                 timeController.text =
//                                     value!.format(context).toString();
//                                 print(value.format(context));
//                               });
//                             },
//                             label: 'Task time',
//                             controller: timeController,
//                             prefix: Icons.watch_later_outlined,
//                             type: TextInputType.datetime,
//                             validate: (value) {
//                               if (value.isEmpty) {
//                                 return 'Time must not be empty';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           defaultFormField(
//                             onTap: () {
//                               showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.parse('2025-12-30'),
//                               ).then((value) {
//                                 dateController.text =
//                                     DateFormat.yMMMd().format(value!);
//                               });
//                             },
//                             label: 'Task date',
//                             controller: dateController,
//                             prefix: Icons.calendar_today,
//                             type: TextInputType.datetime,
//                             validate: (String value) {
//                               if (value.isEmpty) {
//                                 return 'Date must not be empty';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   elevation: 25.0,
//                 )
//                 .closed
//                 .then((value) {
//               isBottomSheetShown = false;
//               setState(() {
//                 fabIcon = Icons.edit;
//               });
//             });
//             isBottomSheetShown = true;
//             setState(() {
//               fabIcon = Icons.add;
//             });
//           }
//         },
//         child: Icon(
//           fabIcon,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.,
//             ),
//             label: 'Tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.check_circle_outline,
//             ),
//             label: 'Done',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.archive_outlined,
//             ),
//             label: 'Archived',
//           ),
//         ],
//       ),
//       body: ConditionalBuilder(
//         condition: screens.length > 0,
//         builder: (context) => screens[currentIndex],
//         fallback: (context) => Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Future<String> getName() async {
//   //   return 'Youssef Essam';
//   // }
//
//   void createDatabase() async {
//     database = await openDatabase(
//         onCreate: (database, version) {
//       // The table consists of:
//       // id integer
//       // title text(String)
//       // date text
//       // time text
//       // status text
//
//       print('DataBase created ! ');
//       database
//           .execute(
//               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//           .then((value) {
//         print('Table created !');
//       }).catchError((error) {
//         print('Error When Creating Table !!! ${error.toString()}');
//       });
//     }, onOpen: (database) {
//       getDataFromDatabase(database).then((value) {
//         setState(() {
//           tasks = value;
//         });
//       });
//       print('DataBase opened ! ');
//     });
//   }
//
//   Future insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     return await database.transaction((txn) async {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")')
//           .then((value) {
//         print('$value Inserted successfully');
//       }).catchError((error) {
//         print('Error When Inserting New Record !!! ${error.toString()}');
//       });
//     });
//   }
//
//   Future<List<Map>> getDataFromDatabase(database) async {
//     return await database.rawQuery('SELECT * FROM tasks');
//   }
// }
