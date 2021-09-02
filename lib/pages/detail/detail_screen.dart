import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gems/utils/color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: buildFotoProducSlider()),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                buildSeller(),
                buildInfoProduct(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Positioned buildInfoProduct() {
    return Positioned(
      top: -75,
      left: 20,
      right: 20,
      child: Card(
        shadowColor: kPrimaryColor.withOpacity(0.3),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Helena Moore',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        '\$18',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('123 Haight Street'),
                  Text('San Francisco , CA 94111'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('15 ml | Size: , 4x2 \"'),
                ],
              ),
            )),
      ),
    );
  }

  int current = 0;
  final CarouselController _controller = CarouselController();

  Widget buildFotoProducSlider() {
    return Hero(
      tag: widget.index,
      child: Material(
        type: MaterialType.transparency,
        child: CarouselSlider(
          items: [
            FlutterLogo(
              size: 150,
            ),
            FlutterLogo(
              size: 150,
            ),
            FlutterLogo(
              size: 150,
            ),
          ],
          carouselController: _controller,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
      ),
    );
  }

  SizedBox buildSeller() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: kPrimaryColor,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Helena Moore',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('seller | Posted 4 Days ago'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bio ',
                        ),
                        Text(
                            'I am college student that likes to collect and trade crystal, gems , etc',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: kAccentColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Icon(
                            Icons.bookmark_border,
                            size: 24,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Message Seller'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}