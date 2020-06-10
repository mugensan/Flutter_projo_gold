import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/application/auth/auth/auth_bloc.dart';
import 'package:flutterstaggeredgridontap/injection.dart';
import 'package:flutterstaggeredgridontap/pages/AboutMePage.dart';
import 'package:flutterstaggeredgridontap/pages/CryptoPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage.dart';
import 'package:flutterstaggeredgridontap/pages/DashboardPage2.dart';
import 'file:///C:/Users/kevro/AndroidStudioProjects/Flutter_projo_gold/lib/pages/portfolio/PortfolioPage.dart';
import 'package:flutterstaggeredgridontap/pages/ReportPage.dart';
import 'package:flutterstaggeredgridontap/pages/SettingsPage.dart';
import 'package:flutterstaggeredgridontap/pages/StocksPage.dart';
import 'package:flutterstaggeredgridontap/pages/myCharts.dart';
import 'package:flutterstaggeredgridontap/pages/portfolio/PortfolioPage.dart';
import 'package:flutterstaggeredgridontap/presentation/routes/router.gr.dart';
import 'package:flutterstaggeredgridontap/presentation/sign_in/sign_in_page.dart';
import 'package:flutterstaggeredgridontap/pages/splashscreen/animatedWidgetPage.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>()
              ..add(const AuthEvent
                  .authCheckRequested()), //calling the auth method to listen the state emitted by the block
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Gold Crypto App',
            theme: ThemeData.light().copyWith(
                primaryColor: Colors.purple[800],
                accentColor: Colors.blueAccent,
                inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
//home: CryptoPage(),
//        builder: ExtendedNavigator(router: Router()),
//      ),
//    );
            initialRoute: '/',
            routes: {
              '/': (BuildContext context) => new DashboardPage(),
              '/DashboardPage': (context) => new DashboardPage(),
              '/PortfolioPage': (BuildContext context) => new MyCharts(),
              '/CryptoPage': (BuildContext context) => new CryptoPage(),
              '/StocksPage': (BuildContext context) => new StocksPage(),
              '/SettingsPage': (BuildContext context) => new SettingsPage(),
              '/ReportPage': (BuildContext context) => new SignInPage(),
              '/AboutMePage': (BuildContext context) => new AboutMePage(),
            }));
  }
}
