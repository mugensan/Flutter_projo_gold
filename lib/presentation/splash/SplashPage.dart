import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/application/auth/auth/auth_bloc.dart';
import 'package:flutterstaggeredgridontap/presentation/routes/router.gr.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},//passing nothing
//            authenticated: (_) => ExtendedNavigator.of(context).pushReplacementNamed(Routes.dashboardPage),
           authenticated:(_)=> ExtendedNavigator.of(context).pushReplacementNamed(Routes.signInPage),

            unauthenticated: (_) => ExtendedNavigator.of(context).pushReplacementNamed(Routes.signInPage),

        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              new Text('Jumping dots'),
//              JumpingDotsProgressIndicator(
//                fontSize: 20.0,
//              ),
//              SizedBox(height: 60.0),
              SizedBox(height: 32.0),
              FadingText('Loading...'),
//              SizedBox(height: 32.0),
//              JumpingText('Loading...'),
//              SizedBox(height: 32.0),
//              ScalingText('Loading...'),
//              SizedBox(height: 32.0),

            ],
          ),
        ),
      ),
    );
  }
}
