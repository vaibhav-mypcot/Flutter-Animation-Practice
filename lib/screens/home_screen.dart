// ignore_for_file: sort_child_properties_last

import 'dart:math';

import 'package:animation_practice/components/side_menu.dart';
import 'package:animation_practice/models/menu_btn.dart';
import 'package:animation_practice/screens/home_animation.dart';
import 'package:animation_practice/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  late AnimationController _controller;

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: 500), // Set the duration of the animation
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17203A),
      body: SafeArea(
        child: Stack(
          children: [
            // SideDrawer Menu
            AnimatedPositioned(
              duration: Duration(milliseconds: 600),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: SideMenu(),
            ),

            // Home Screen Data
            // Use transform to rotate screen
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                // to rotate 30 degree
                ..rotateY(animation.value - 30 * animation.value * pi / 180),
              child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Tween<double>(
                            begin: isSideMenuClosed ? 0 : 24,
                            end: isSideMenuClosed ? 24 : 0,
                          )
                              .animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Curves.easeInOut,
                                ),
                              )
                              .value,
                        ),
                        child: HomeAnimation(),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Drawer Button
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: 16,
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? 0 : 220,
              child: MenuButton(
                riveOnInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: "State Machine");
                  isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                  isSideBarClosed.value = true;
                },
                press: () {
                  isSideBarClosed.value = !isSideBarClosed.value;
                  if (isSideMenuClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    isSideMenuClosed = isSideBarClosed.value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
