import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/application/auth/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
              (){},
                (either)=>either.fold(
                      (failure){
                  //SNACKBAR
                },
                    (_){
                  //NAVIGATE INTO APP
                    },
                ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: ListView(
            children: <Widget>[
              const Text(
                'LOGO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 130,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: 'Email'),
                autocorrect: false,
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .bloc<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                        (f) => f.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                autocorrect: false,
                obscureText: true,
                //this hides the pass with the dots
                onChanged: (value) => context
                    .bloc<SignInFormBloc>()
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.bloc<SignInFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                              shortPassword: (_) => 'Password to short',
                              orElse: () => null,
                            ),
                        (_) => null),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN HERE'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER HERE'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  context.bloc<SignInFormBloc>().add(
                        const SignInFormEvent.signInWithGooglePressed(),
                      );
                },
                color: Colors.lightBlue,
                child: const Text(
                  "SIGN IN WITH GOOGLE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
