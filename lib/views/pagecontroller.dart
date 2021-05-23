import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/card.dart';
import 'package:shopapp/json/slider.dart';
import 'package:shopapp/views/home/home.dart';

class PageControllerView extends StatefulWidget {
  @override
  _PageControllerViewState createState() => _PageControllerViewState();
}

class _PageControllerViewState extends State<PageControllerView> {
  var pages = [
    HomePageViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildGetAppbar(),
        body: buildgetBody(),
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 50,
        ),
      ),
    );
  }

  Widget buildgetBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('New arrivals'),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: sliders.length,
            itemBuilder: (context, index) {
              return GetBuilder<CartControllers>(
                builder: (val) {
                  return Container(
                    height: 50,
                    width: 500,
                    child: Column(
                      children: [
                        Text(sliders[index].desc),
                        Container(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              val.sepeteEkle(sliders[index]);
                            },
                            child: Text(
                              'Sepete Ekle',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          sliders[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

        //Container(child: ,)
      ],
    );
  }

  PreferredSize buildGetAppbar() {
    return PreferredSize(
      child: Container(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.zoom_in),
            Icon(Icons.add_alert),
            GetBuilder<CartControllers>(
              builder: (val) {
                return Text(
                  val.count.toString(),
                );
              },
            )
          ],
        ),
      ),
      preferredSize: Size.fromHeight(80),
    );
  }
}
