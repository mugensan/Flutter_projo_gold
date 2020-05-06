import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

///WHAT KIND OF ERRORS CAN WE IMAGINE HAPPENING
///1. user cancels the sign in (google)
///2. error with server
///3. duplicates
///4. invalid combo of @$$pass
///
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory AuthFailure.serverError() = ServerError;

  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  const factory AuthFailure.invalidEmailAndPasswordCombination() =
  InvalidEmailAndPasswordCombination;
}