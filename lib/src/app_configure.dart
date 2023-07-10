import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_2023/injector.dart';
import 'package:flutter_clean_architecture_2023/src/presentation/my_app.dart';

///
/// flutter_clean_architecture_2023
/// File Name: app_configure
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
enum BuildType { develop, product }

class AppConfigure {
  static AppConfigure? _instance;
  static AppConfigure get instance => _instance!;

  final BuildType buildType;

  AppConfigure._(this.buildType);

  factory AppConfigure.newInstance(BuildType buildType) {
    _instance ??= AppConfigure._(buildType);
    return _instance!;
  }

  void run() {
    configureDependencies();
    runApp(const MyApp());
  }
}
