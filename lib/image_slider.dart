import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class image_slider extends StatefulWidget {
  @override
  _image_sliderState createState() => _image_sliderState();
}

class _image_sliderState extends State<image_slider> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(

          options: CarouselOptions(
            height: 150,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,


          ),
          items: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    'images/skincare_image8.png',
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ]

        )
      ],
    );
  }
}
