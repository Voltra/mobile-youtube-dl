import 'dart:io';

import 'package:youtubedl/domain/exceptions/ExtractorException.dart';

abstract class InfoExtractor {
  dynamic _downloader = null;
  bool _ready = false;
  bool _working = true;

  InfoExtractor(this._downloader);

  Future extract(String url) async {
    try {
      await initialize();
      return _realExtract(url);
    } on SocketException catch (e) {
      print(e);
    } on ExtractorException catch (e) {
      print(e);
    }
  }

  Future _realExtract(String url);

  Future initialize() async {
    if (!_ready) {
      await _realInitialize();
      _ready = true;
    }
  }

  Future _realInitialize();
}

abstract class SearchInfoExtractor extends InfoExtractor {
  SearchInfoExtractor(downloader) : super(downloader);

  @override
  Future _realExtract(String url) async {
    final matches = _validUrlPattern.allMatches(url);
    if (matches.isEmpty) {
      throw ExtractorException("Invalid search query $url");
    }

    final match = matches.first; //TODO: Check what the matches are
    final prefix = match.namedGroup("prefix");
    final query = match.namedGroup("query");

    switch (prefix) {
      case "":
        return _getResults(query, 1);

      case "all":
        return _getResults(query, _maxResults);

      default:
        var n = int.parse(prefix);
        if (n <= 0)
          throw ExtractorException(
              "Invalid download number $n for query $query");
        else if (n > _maxResults) {
          //TODO: report error
          n = _maxResults;
        }

        return _getResults(query, n);
    }
  }

  bool suitable(String url) {
    return _validUrlPattern.hasMatch(url);
  }

  Future _getResults(String query, int n);

  String get _searchKey;
  int get _maxResults;

  RegExp get _validUrlPattern =>
      RegExp("$_searchKey(?<prefix>|[1-9]\\d*|all):(<query>[\\s\\S]+)");
}
