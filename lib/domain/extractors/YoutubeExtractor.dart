import 'package:youtubedl/domain/extractors/Extractor.dart';

/// see https://github.com/ytdl-org/youtube-dl/blob/master/youtube_dl/extractor/youtube.py#L58
class YoutubeBaseInfoExtractor extends InfoExtractor {
  static const LOGIN_URL = "https://accounts.google.com/ServiceLogin";
  static const TWOFACTOR_URL = "https://accounts.google.com/signin/challenge";
  static const LOOKUP_URL = "https://accounts.google.com/_/signin/sl/lookup";
  static const CHALLENGE_URL =
      "https://accounts.google.com/_/signin/sl/challenge";
  static const TFA_URL =
      "https://accounts.google.com/_/signin/challenge?hl=en&TL={0}";
  static const NETRC_MACHINE = "youtube";
  static const LOGIN_REQUIRED = false;
  static final playlistIdPattern =
      RegExp("(?:PL|LL|EC|UU|FL|RD|UL|TL|PU|OLAK5uy_)[0-9A-Za-z-_]{10,}");
  static const HEADERS = {
    "x-youtube-client-name": "1",
    "x-youtube-client-version": "1.20200609.04.02",
  };

  YoutubeBaseInfoExtractor(downloader) : super(downloader);
}
