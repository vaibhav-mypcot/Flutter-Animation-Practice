import 'dart:math';

import 'package:animation_practice/components/all_destinations/all_destinations.dart';
import 'package:animation_practice/components/top_destinations/top_destinations.dart';
import 'package:animation_practice/data/destination_data.dart';
import 'package:animation_practice/data/hotels_data.dart';
import 'package:animation_practice/screens/craousel_animation.dart';
import 'package:animation_practice/screens/destination_detail.dart';
import 'package:flutter/material.dart';

class HomeAnimation extends StatefulWidget {
  const HomeAnimation({super.key});

  @override
  State<HomeAnimation> createState() => _HomeAnimationState();
}

class _HomeAnimationState extends State<HomeAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff17203a),
            toolbarHeight: 68,
            pinned: true,
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('What you would like to find?'),
              background: Stack(
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1544002177-fce4696659d8?q=80&w=3988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ],
              ),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Best Destinations",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 14),
                  SizedBox(height: 16),
                  const AllDestinations(
                    padding: 24.0,
                    spacing: 24.0,
                  ),
                ],
              ),
              SizedBox(height: 16),
              const TopDestinations(
                padding: 24.0,
                spacing: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Best Hotels",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const BestHotelList(),
                ],
              ),
              // Watch best movies in the town
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Best Movies",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    margin: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CarouselAnimation(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff17203a)),
                      child: Text(
                        'Watch Movies',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class BestDestinationList extends StatelessWidget {
  const BestDestinationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 18, left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: destination_data.length, // Replace with your item count
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DestinationDetails(
                    index: index,
                    image: destination_data[index].image,
                    placeName: destination_data[index].placeName,
                    placeInfo: destination_data[index].placeDescription,
                  ),
                ),
              );
            },
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(destination_data[index].image),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      destination_data[index].placeName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BestHotelList extends StatefulWidget {
  const BestHotelList({super.key});

  @override
  State<BestHotelList> createState() => _BestHotelListState();
}

class _BestHotelListState extends State<BestHotelList> {
  final _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _opty;
    return Center(
      child: SizedBox(
        height: 450.0,
        child: PageView.builder(
          controller: _controller,
          itemCount: hotelsData.length,
          itemBuilder: (context, index) {
            if (index == _currentPage) {
              _opty = 1;
              return Transform.scale(
                scale: 1.3,
                child: _pageImage(index, _opty),
              );
            } else if (index < _currentPage) {
              _opty = max(1 - (_currentPage - index), 0.5);
              return Transform.scale(
                scale: max(1.3 - (_currentPage - index), 0.8),
                child: _pageImage(index, _opty),
              );
            } else {
              _opty = max(1 - (index - _currentPage), 0.5);
              return Transform.scale(
                scale: max(1.3 - (index - _currentPage), 0.8),
                child: _pageImage(index, _opty),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _pageImage(int index, double opty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            // image: AssetImage(destination_data[index].image),
            image: NetworkImage(hotelsData[index].image),
            fit: BoxFit.cover,
            opacity: opty,
          ),
        ),
      ),
    );
  }
}
