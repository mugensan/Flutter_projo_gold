import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutterstaggeredgridontap/injection.dart';
import 'package:flutterstaggeredgridontap/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Or Register'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
