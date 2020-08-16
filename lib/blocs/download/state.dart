import 'package:super_enum/super_enum.dart';

part 'state.g.dart';

@superEnum
enum _DownloadState {
  @object
  Initial,
  @object
  UrlFed,
  @object
  DirectoryChosen,
  @object
  LoadingState,
  @object
  DoneState,
  @object
  ErrorState,
}
