/// see https://github.com/ytdl-org/youtube-dl/blob/master/youtube_dl/__init__.py
/// see https://github.com/ytdl-org/youtube-dl/blob/master/youtube_dl/options.py
class Options {
  final String url;
  final String format = "bestaudio/best";
  final String filenameTemplate;
  final bool ignoreErrors;
  final String outputFolder;

  Options({
    this.url,
    this.filenameTemplate,
    this.ignoreErrors,
    this.outputFolder,
  });
}
