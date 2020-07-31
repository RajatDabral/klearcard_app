import 'package:flutter/material.dart';
import 'package:klearcard_app/src/provider/expense_provider.dart';
import 'package:klearcard_app/src/provider/wallet_provider.dart';
import 'package:klearcard_app/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WalletProvider>(
          create: (context) => WalletProvider(),
        ),
        ChangeNotifierProvider<ExpenseProvider>(
          create: (context) => ExpenseProvider(),
        ),
      ],
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
