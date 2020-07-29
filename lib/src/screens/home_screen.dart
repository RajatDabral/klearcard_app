import 'package:flutter/material.dart';
import 'package:klearcard_app/src/widgets/carousel.dart';
import 'package:klearcard_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
          child: Column(
            children: [
              Carousel(),
            ],
          ),
        ),
      ),
    );
  }
}
