import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:noto_app/utils/log.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class NetworkConnectionService {
  NetworkConnectionService() {
    final _isConnectedStream = Connectivity()
        .onConnectivityChanged
        .map((event) => event != ConnectivityResult.none)
        .defaultIfEmpty(false)
        .asBroadcastStream();

    _isConnectedStream.listen((isConnected) {
      _subject.add(isConnected);
    });

    isConnectedStream.listen((isConnected) {
      log.d("isConnected: $isConnected");
    });
  }

  final _subject = BehaviorSubject<bool>();

  Stream<bool> get isConnectedStream => _subject.stream;

  bool get isConnected => _subject.value;

  bool get isNotConnected => isConnected == false;

  void dispose() {
    _subject.close();
  }
}
