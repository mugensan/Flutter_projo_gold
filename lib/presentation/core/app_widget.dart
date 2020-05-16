
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
        '/': (BuildContext context) => new SignInPage(),
        '/DashboardPage': (context) => new DashboardPage(),
        '/PortfolioPage': (BuildContext context) => new PortfolioPage(),
        '/CryptoPage': (BuildContext context) => new CryptoPage(),
        '/StocksPage': (BuildContext context) => new StocksPage(),
        '/SettingsPage': (BuildContext context) => new SettingsPage(),
        '/ReportPage': (BuildContext context) => new ReportPage(),
        '/AboutMePage': (BuildContext context) => new AboutMePage(),
      },
    );
  }
}