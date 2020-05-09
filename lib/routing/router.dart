import 'package:flutter/material.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/PortfolioPage.dart';


Route<dynamic>generateRoute(RouteSettings settings){
  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder:(context) => DashboardPage());

    case '/PortfolioPage':
      return MaterialPageRoute(builder:(context) => PortfolioPage());

    case '/CryptoPage':
      return MaterialPageRoute(builder:(context) => CryptoPage());

      break;
    default:
      return MaterialPageRoute(builder:(context) => DashboardPage());
  }
}