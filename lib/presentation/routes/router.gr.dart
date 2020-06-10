// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutterstaggeredgridontap/presentation/splash/SplashPage.dart';
import 'package:flutterstaggeredgridontap/presentation/sign_in/sign_in_page.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/StocksPage.dart';

abstract class Routes {
  static const splashPage = '/';
  static const signInPage = '/sign-in-page';
  static const aboutMePage = '/about-me-page';
  static const cryptoPage = '/crypto-page';
  static const dashboardPage = '/dashboard-page';
  static const reportPage = '/report-page';
  static const stocksPage = '/stocks-page';
  static const all = {
    splashPage,
    signInPage,
    aboutMePage,
    cryptoPage,
    dashboardPage,
    reportPage,
    stocksPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashPage(),
          settings: settings,
        );
      case Routes.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInPage(),
          settings: settings,
        );
      case Routes.aboutMePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AboutMePage(),
          settings: settings,
        );
      case Routes.cryptoPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => CryptoPage(),
          settings: settings,
        );
      case Routes.dashboardPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => DashboardPage(),
          settings: settings,
        );
      case Routes.reportPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ReportPage(),
          settings: settings,
        );
      case Routes.stocksPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StocksPage(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSplashPage() => pushNamed(Routes.splashPage);

  Future pushSignInPage() => pushNamed(Routes.signInPage);

  Future pushAboutMePage() => pushNamed(Routes.aboutMePage);

  Future pushCryptoPage() => pushNamed(Routes.cryptoPage);

  Future pushDashboardPage() => pushNamed(Routes.dashboardPage);

  Future pushReportPage() => pushNamed(Routes.reportPage);

  Future pushStocksPage() => pushNamed(Routes.stocksPage);
}
