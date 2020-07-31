import 'package:flutter/material.dart';
import 'package:klearcard_app/src/provider/expense_provider.dart';
import 'package:klearcard_app/src/screens/bottom_nav_screen.dart';
import 'package:klearcard_app/src/widgets/carousel.dart';
import 'package:klearcard_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcdcdcd),
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Carousel(),
                Transcation(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavScreen(),
    );
  }
}
