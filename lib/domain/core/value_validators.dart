import 'package:dartz/dartz.dart';
import 'package:flutterstaggeredgridontap/domain/core/failures.dart';

//validation function


Either<ValueFailure<String>,String> validateEmailAddress(String input){
  //regular expression
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  //if valid
  if(RegExp(emailRegex).hasMatch(input)){
    return right(input);//right side correct data
  }else{
    //if !valid throw custom exception
    return left(ValueFailure.invalidEmail(failedValue: input));//left side incorrect data
  }
}

Either<ValueFailure<String>,String> validatePassword(String input){

  //if password has 6+ letters
  if(input.length >= 6){
    return right(input);//right side correct data
  }else{
    //if !valid throw custom exception
    return left(ValueFailure.shortPassword(failedValue: input));//left side incorrect data
  }
}

