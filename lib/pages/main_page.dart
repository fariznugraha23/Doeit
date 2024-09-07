
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}):super(key: key);

  @override
  State<MainPage> createState() => _MainPagetState();
}

class _MainPagetState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        backButton: false,
        locale: 'id',
        accent: Colors.purple,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){}, 
      backgroundColor: Colors.purple, 
      child: Icon(Icons.add, color: Colors.white,),
    ),
    body: HomePage(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(child: 
    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly, children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.home)),
      SizedBox(
        width: 20,
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.list))
    ],) ,),
    );
  }
}