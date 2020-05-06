import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterstaggeredgridontap/domain/core/failures.dart';
import 'package:flutterstaggeredgridontap/domain/core/value_objects.dart';
import 'package:flutterstaggeredgridontap/domain/core/value_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

///VALIDATION LOGIC -> MAKING ILLEGAL STATE UNREPRESENTABLE
///instead of having to many abstract class and many subclasses
///to catch all the exceptions, I will be using the freeze library
///provided by Dart in order to use a Union Validation to throw errors
///or validate Email address && create automatic test


//VALIDATING EMAIL ADDRESS
class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null); //checks if input is null or has errors
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
  //making private "_"
  const EmailAddress._(this.value);
}

//VALIDATING PASSWORD LENGTH >=6 (IF NEED CHAR || OTHER SPEC, DEFINE HERE)
class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null); //checks if input is null or has errors
    return Password._(
      validatePassword(input),
    );
  }

  //making private "_"
  const Password._(this.value);
}
