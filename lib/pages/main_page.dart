
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:Doeit/pages/category_page.dart';
import 'package:Doeit/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}):super(key: key);

  @override
  State<MainPage> createState() => _MainPagetState();
}

class _MainPagetState extends State<MainPage> {
  final List <Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;
  void onTapTapped (int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex==0)? CalendarAppBar(
        backButton: false,
        locale: 'id',
        accent: Colors.purple,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ) : PreferredSize(
        child: Container(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          child: Text('Kategori', style:TextStyle(fontSize: 20)),
        )),
        preferredSize: Size.fromHeight(100)),

      floatingActionButton: Visibility(
        visible: (currentIndex==0) ? true : false,
        child: FloatingActionButton(
          onPressed:(){}, 
        backgroundColor: Colors.purple, 
        child: Icon(Icons.add, color: Colors.white,),
            ),
      ),
    body: _children[currentIndex],
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(child: 
    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly, children: [
      IconButton(onPressed: (){
        onTapTapped(0);
      }, icon: Icon(Icons.home)),
      SizedBox(
        width: 20,
      ),
      IconButton(onPressed: (){
        onTapTapped(1);
      }, icon: Icon(Icons.list))
    ],) ,),
    );
  }
}