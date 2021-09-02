import 'package:flutter/material.dart';
import 'package:gems/pages/detail/detail_screen.dart';
import 'package:gems/utils/color.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({ Key? key,this.index }) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DetailScreen(index: index!,)));
      },
      child: Hero(  
        tag: index!,
        child: Material(  
          type: MaterialType.transparency,
          child: Padding(  
            padding: const EdgeInsets.only(left: 20, top: 30, right: 10, bottom: 0),
            child: Stack(  
               children: [
                 Card(
                  shadowColor: kPrimaryColor.withOpacity(0.3),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Angle Aura Point',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Pier 39'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('San Francisco, CA 94133 '),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('12 mi  |  2x2\"'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text('\$10',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                Positioned(
                  left: -10,
                  top: -10,
                  child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.ac_unit)),
                ),
               ],
            ),
          ),
        ),
      ),

    );
      
    
  }
}