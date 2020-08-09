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
