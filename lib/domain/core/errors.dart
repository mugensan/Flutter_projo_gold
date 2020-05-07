import 'package:flutterstaggeredgridontap/domain/core/failures.dart';

///IF WE ARRIVE AT A POINT OF CODE DESTROYING THE APP WE WANT THE APP TO CRASH!

class UnexpectedValueError extends Error{
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
}

@override
String toString(){
  //if user is in an old machine safeToString will show error with symbols as well
  return Error.safeToString('ValureFailure... TERMINATING!. The failure is: $ValueFailure');
}

