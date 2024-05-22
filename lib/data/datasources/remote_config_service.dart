import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 1),
        ),
      );
      await ensureInitialized();
      await fetchAndActivate();
    } catch (e) {
      // Handle error
      print('Unable to fetch remote config. Default values will be used.');
    }
  }

  Future<void> fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  Future<void> ensureInitialized() async {
    await _remoteConfig.ensureInitialized();
  }

  Map<String, dynamic> get cardOrder =>
      jsonDecode(_remoteConfig.getValue('cards_order').asString());
  String get welcome => _remoteConfig.getString('welcome');
}
