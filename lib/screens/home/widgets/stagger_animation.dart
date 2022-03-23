import 'package:animacoes_complexas/screens/home/widgets/animated_list_view.dart';
import 'package:flutter/material.dart';

import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  
  final AnimationController controller;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;

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
    );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        HomeTop(
          containerGrow: containerGrow
        ),
        AnimatedListView(
          listSlidePosition: listSlidePosition
        )
      ],
    );
  }
}