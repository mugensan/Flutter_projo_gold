
import 'package:flutter/material.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/PortfolioPage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/SettingsPage.dart';
import 'package:flutterstaggeredgridontap/pages/StocksPage.dart';
import 'package:flutterstaggeredgridontap/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gold Crypto App',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple[800],
        accentColor: Colors.blueAccent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
        )
      ),
//home: CryptoPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/DashboardPage': (context) => DashboardPage(),
        '/PortfolioPage': (context) => PortfolioPage(),
        '/CryptoPage': (context) => CryptoPage(),
        '/StocksPage': (context) => StocksPage(),
        '/SettingsPage': (context) => SettingsPage(),
        '/ReportPage': (context) => ReportPage(),
        '/AboutMePage': (context) => AboutMePage(),
      },
    );
  }
}