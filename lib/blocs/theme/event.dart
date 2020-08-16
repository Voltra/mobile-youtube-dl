import 'package:super_enum/super_enum.dart';

part 'event.g.dart';

const Cardinal = Data(fields: [
  DataField<String>("cardinal"),
]);

@superEnum
enum _ThemeEvent {
  @object
  LoadTheme,

  @Cardinal
  SaveTheme,

  @Cardinal
  ChangeTheme,
}
