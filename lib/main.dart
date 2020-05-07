import 'package:flutter/material.dart';
import 'package:flutterstaggeredgridontap/injection.dart';
import 'package:flutterstaggeredgridontap/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
