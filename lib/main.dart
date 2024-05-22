import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_words/app/app.dart';
import 'package:flutter_words/core/services/injection_container.dart';
import 'package:flutter_words/data/datasources/remote_config_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  final remoteConfigService = sl<RemoteConfigService>();
  await remoteConfigService.initialize();
  runApp(const MyApp());
}
