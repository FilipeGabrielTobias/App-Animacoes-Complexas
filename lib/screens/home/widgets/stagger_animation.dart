import 'package:animacoes_complexas/screens/home/widgets/animated_list_view.dart';
import 'package:flutter/material.dart';

import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  
  final AnimationController controller;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeAnimation;

  StaggerAnimation({@required this.controller}) : 
    containerGrow = CurvedAnimation(
      parent: controller, 
      curve: Curves.ease
    ),
    listSlidePosition = EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 0),
      end: const EdgeInsets.only(bottom: 80)
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.325,
          0.8,
          curve: Curves.ease
        )
      )
    ),
    fadeAnimation = ColorTween(
      begin: const Color.fromRGBO(247, 64, 106, 1.0),
      end: const Color.fromRGBO(247, 64, 106, 0.0)
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.decelerate
      )
    );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition
            )
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        )
      ]
    );
  }
}