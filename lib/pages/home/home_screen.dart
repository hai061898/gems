import 'package:flutter/material.dart';
import 'package:gems/pages/home/components/card_detail.dart';
import 'package:gems/pages/home/components/category.dart';
import 'package:gems/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            color: kAccentColor, borderRadius: BorderRadius.circular(30)),
        child: Column(  
          children: [
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Search for Gems',
                  contentPadding: EdgeInsets.all(8),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ListView(  
                 scrollDirection: Axis.horizontal,
                 children: [
                   Category(active: true,label: 'Quartz',iconData: Icons.ac_unit,),
                   Category(label: 'Selenite',),
                   
                 ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index)=>CardDetail(index: index,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
