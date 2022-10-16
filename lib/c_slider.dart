import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class cSlider extends StatefulWidget {
  const cSlider({Key? key}) : super(key: key);

  @override
  State<cSlider> createState() => _cSliderState();
}

class _cSliderState extends State<cSlider> {
  List images = [];

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)!.settings.arguments;

    dynamic resc = res;

    int index = resc;

    images = Global.imageList[index]['imageTypes'];

    return Scaffold(
      appBar: AppBar(
        title: Text("${Global.imageList[index]['type']}"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 400, enlargeCenterPage: true),
          items: images
              .map((e) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(e['image']), fit: BoxFit.fill)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
