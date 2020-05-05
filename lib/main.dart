import 'package:flutter/material.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/PortfolioPage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/SettingsPage.dart';
import 'package:flutterstaggeredgridontap/pages/StocksPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,


      ),
home: CryptoPage(),
//      initialRoute: '/',
//      routes: {
//        '/': (context) => DashboardPage(),
//        '/DashboardPage': (context) => DashboardPage(),
//        '/PortfolioPage': (context) => PortfolioPage(),
//        '/CryptoPage': (context) => CryptoPage(),
//        '/StocksPage': (context) => StocksPage(),
//        '/SettingsPage': (context) => SettingsPage(),
//        '/ReportPage': (context) => ReportPage(),
//        '/AboutMePage': (context) => AboutMePage(),
//      },
    );
  }
}

//      home: Dashboard(),
