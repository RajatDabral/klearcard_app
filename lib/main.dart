import 'package:flutter/material.dart';
import 'package:klearcard_app/src/provider/wallet_provider.dart';
import 'package:klearcard_app/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalletProvider(),
      child: MaterialApp(
        title: 'KlearCard',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
