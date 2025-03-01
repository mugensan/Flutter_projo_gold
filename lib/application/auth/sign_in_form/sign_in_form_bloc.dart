import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstaggeredgridontap/domain/auth/auth_failure.dart';
import 'package:flutterstaggeredgridontap/domain/auth/i_auth_facade.dart';
import 'package:flutterstaggeredgridontap/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

///1. check if the password and @ are correct
///2. if valid -> register using IAuthFacade and yield Some<Right<Unit>>
///int the authFailureOrSuccessOption state field
///3. if invalid -> authFailureOrSuccessOption set to none


part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';


@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
      SignInFormEvent event,
      ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword,
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.signInWithEmailAndPassword,
        );
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
  Future<Either<AuthFailure, Unit>> Function({
    @required EmailAddress emailAddress,
    @required Password password,
  })
  forwardedCall,
  ) async* {
  Either<AuthFailure, Unit> failureOrSuccess;

  final isEmailValid = state.emailAddress.isValid();
  final isPasswordValid = state.password.isValid();

  if (isEmailValid && isPasswordValid) {
  yield state.copyWith(
  isSubmitting: true,
  authFailureOrSuccessOption: none(),
  );

  failureOrSuccess = await forwardedCall(
  emailAddress: state.emailAddress,
  password: state.password,
  );
  }

  yield state.copyWith(
  isSubmitting: false,
  showErrorMessages: true,
  authFailureOrSuccessOption: optionOf(failureOrSuccess),
  );
  }
}
