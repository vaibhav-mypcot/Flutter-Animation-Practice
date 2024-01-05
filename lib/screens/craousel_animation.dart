import 'package:animation_practice/data/movies_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselAnimation extends StatefulWidget {
  const CarouselAnimation({super.key});

  @override
  State<CarouselAnimation> createState() => _CarouselAnimationState();
}

class _CarouselAnimationState extends State<CarouselAnimation> {
  CarouselController _carouselController = new CarouselController();

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Image.network(moviesData[_current].image),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(1),
                    Colors.grey.shade50.withOpacity(0),
                    Colors.grey.shade50.withOpacity(0),
                    Colors.grey.shade50.withOpacity(0),
                    Colors.grey.shade50.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: moviesData.map((data) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          height: 320,
                          margin: const EdgeInsets.only(top: 30),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            data.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data.placeName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // rating
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            data.placeDescription,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey.shade600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity:
                              _current == moviesData.indexOf(data) ? 1.0 : 0.0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '2h',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Watch',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                });
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
