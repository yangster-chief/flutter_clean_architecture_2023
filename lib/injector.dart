import 'package:flutter_clean_architecture_2023/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_clean_architecture_2023
/// File Name: injector
/// Created by sujangmac on 2023/07/10
///
/// Description:
///
final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();
