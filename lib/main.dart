import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doppio_dev_site/app/index.dart';
import 'package:doppio_dev_site/core/logger.dart';
import 'package:doppio_dev_site/core/simple_bloc_delegate.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainApp');

Future<void> main() async {
  await init();
  await runZonedGuarded<Future<Null>>(() async {
    runApp(AppPage());
  }, (Object error, StackTrace stackTrace) async {
    log('$error', name: 'Main', error: error, stackTrace: stackTrace);
  });
}

Future<void> init({bool ensureInitialized = true}) async {
  try {
    if (ensureInitialized == true) {
      WidgetsFlutterBinding.ensureInitialized();
    }
    Bloc.observer = SimpleBlocDelegate();
  } catch (error, stackTrace) {
    log('$error', name: 'Main', error: '$error', stackTrace: stackTrace);
  }
}
