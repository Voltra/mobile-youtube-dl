import 'dart:io';

import './Options.dart';

class Downloader {
  final Options options;

  Downloader({
    this.options,
  });

  Future download() async {
    try {
      final res = await _extractInfo(options.url);
    } on SocketException catch (e) {
      print(e);
    }
  }

  Future _extractInfo(String url) async {
    final ieKey = "Generic";
    final ies = [
      _getInfoExtractor(ieKey),
    ];
  }

  dynamic _getInfoExtractor(String ieKey) {}
}
