import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutterstaggeredgridontap/domain/auth/auth_failure.dart';
import 'package:flutterstaggeredgridontap/domain/auth/i_auth_facade.dart';
import 'package:flutterstaggeredgridontap/domain/auth/user.dart';
import 'package:flutterstaggeredgridontap/domain/auth/value_objects.dart';
import 'package:flutterstaggeredgridontap/domain/core/errors.dart';
import 'package:google_sign_in/google_sign_in.dart';

///need to extract the value of value object, as the implementation requests String

class FirebaseAuthFacade implements IAuthFacade{
@required final FirebaseAuth _firebaseAuth;
@required final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth,this._googleSignIn);



  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password}) async {

    //Extracting
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr,
          password: passwordStr);
    }on PlatformException catch (e){
      if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE'){
        return left(const AuthFailure.emailAlreadyInUse());
      }else{
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password})async {

    //Extracting
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr,
          password: passwordStr);
    }on PlatformException catch (e){
      if(e.code == 'ERROR_WRONG_PASSWORD'||
          e.code == 'ERROR_USER_NOT_FOUND'){
        //if malicious user trying to hack data of user, we are complicating his life
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      }else{
        return left(const AuthFailure.serverError());
      }
    }
    return null;
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      //Google specific auth
      final googleAuthentification = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.getCredential(
          idToken: googleAuthentification.idToken,
          accessToken: googleAuthentification.accessToken);
      return _firebaseAuth.signInWithCredential(authCredential).then((r) =>
          right(unit));
    }on PlatformException catch (_){
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    return null;
  }


}