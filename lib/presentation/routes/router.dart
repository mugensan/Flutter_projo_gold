import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/StocksPage.dart';
import 'package:flutterstaggeredgridontap/presentation/sign_in/sign_in_page.dart';
import 'package:flutterstaggeredgridontap/presentation/splash/SplashPage.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router{
  @initial
  SplashPage splashPage;
  SignInPage signInPage;
  AboutMePage aboutMePage;
  CryptoPage cryptoPage;
  DashboardPage dashboardPage;
  ReportPage reportPage;
  StocksPage stocksPage;
}