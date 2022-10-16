import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel Slider"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        alignment: Alignment.center,
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 50,
          children: Global.imageList
              .map((index) => InkWell(
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(context, 'c_slider',
                              arguments: index);
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 210,
                          width: 150,
                          padding: EdgeInsets.all(30),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12,
                            image: DecorationImage(
                                image: AssetImage(index['mainType']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text(
                          index['type'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
        // child: GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         mainAxisSpacing: 10,
        //         crossAxisSpacing: 10,
        //         crossAxisCount: 2,
        //         mainAxisExtent: 250),
        //     itemCount: Global.imageList.length,
        //     itemBuilder: (context, index) {
        //       return InkWell(
        //         onTap: () {
        //           setState(
        //             () {
        //               Navigator.pushNamed(context, 'c_slider',
        //                   arguments: index);
        //             },
        //           );
        //         },
        //         child: Column(
        //           children: [
        //             Container(
        //               height: 210,
        //               width: 150,
        //               padding: EdgeInsets.all(30),
        //               margin: EdgeInsets.only(top: 15),
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.black12,
        //                 image: DecorationImage(
        //                     image: AssetImage(
        //                         "${Global.imageList[index]['mainType']}"),
        //                     fit: BoxFit.cover),
        //               ),
        //             ),
        //             Text(
        //               "${Global.imageList[index]['type']}",
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 17,
        //                   color: Colors.blueGrey),
        //             )
        //           ],
        //         ),
        //       );
        //     }),
      ),
    );
  }
}
