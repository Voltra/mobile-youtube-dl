import 'package:super_enum/super_enum.dart';

part 'event.g.dart';

@superEnum
enum _DownloadEvent {
  @Data(fields: [
    DataField<String>("url"),
  ])
  InputUrl,

  @Data(fields: [
    DataField<String>("folderPath"),
  ])
  PickFolder,

  @Data(fields: [
    DataField<String>("message"),
  ])
  ErrorEvent,

  @object
  DoneEvent,

  @Data(fields: [
    DataField<String>("url"),
    DataField<String>("folderPath"),
  ])
  LoadingEvent,
}
