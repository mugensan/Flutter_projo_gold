import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/domain/auth/auth_failure.dart';
import 'package:flutterstaggeredgridontap/domain/auth/i_auth_facade.dart';
import 'package:flutterstaggeredgridontap/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';


class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event,) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          //resetting the response if changed (updated)
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          //resetting the response if changed (updated)
          authFailureOrSuccessOption: none(),
        );
      },

      ///1. check if the password and @ are correct
      ///2. if valid -> register using IAuthFacade and yield Some<Right<Unit>>
      ///int the authFailureOrSuccessOption state field
      ///3. if invalid -> authFailureOrSuccessOption set to none
      registerWithEmailAndPasswordPressed: (e) async* {
        final isEmailValid = state.emailAddress.isValid();
        final isPassword = state.password.isValid();

        if (isEmailValid && isPassword) {
          //assuming they are valid
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );
          final failureOrSuccess =
          await _authFacade.registerWithEmailAndPassword(
              emailAddress: state.emailAddress,
              password: state.password);
          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          );
        }else{
          yield state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          );
        }
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        final isEmailValid = state.emailAddress.isValid();
        final isPassword = state.password.isValid();

        if (isEmailValid && isPassword) {
          //assuming they are valid
          yield state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );
          final failureOrSuccess =
          await _authFacade.signInWithEmailAndPassword(
              emailAddress: state.emailAddress,
              password: state.password);
          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          );
        }else{
          yield state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccessOption: none(),
          );
        }
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        //google response
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },);
  }
}