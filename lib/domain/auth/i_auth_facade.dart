import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterstaggeredgridontap/domain/auth/user.dart';
import 'package:flutterstaggeredgridontap/domain/auth/value_objects.dart';
import 'package:flutterstaggeredgridontap/domain/auth/auth_failure.dart';

///INTERFACE with facade (design pattern) used to connect 2 or more classes with weird facades
///also 1 class for google and firebase auth

abstract class IAuthFacade {
  //Option -> non nullable type
  Future<Option<User>> getSignedInUser();

  //REGISTER
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    //USING THE CREATED VALIDATORS

    @required EmailAddress emailAddress,
    @required Password password,
  });

//SIGN IN
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    //USING THE CREATED VALIDATORS
    @required EmailAddress emailAddress,
    @required Password password,
  });

//GOOGLE SIGN IN
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
