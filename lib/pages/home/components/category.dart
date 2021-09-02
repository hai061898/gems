import 'package:flutter/material.dart';
import 'package:gems/utils/color.dart';

class Category extends StatelessWidget {
  const Category({Key? key, this.active = false,this.label,this.iconData}) : super(key: key);
  final bool? active ;
  final String? label;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children:[
          Card(
            shadowColor: kPrimaryColor.withOpacity(0.3),
            elevation: 15,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: active == true ? kPrimaryColor : Colors.white,
            child: Padding(  
              padding:const EdgeInsets.all(8.0),
              child: Container(  
                width: 50,
                height: 50,
                child: IconButton(  
                  icon: Icon(iconData, color: active== true ? Colors.white: kPrimaryColor,),
                  onPressed: (){},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label!,
            style:
                TextStyle(fontWeight: active == true ? FontWeight.bold : null),
          )
        ]
      ),
    );
  }
}
