import 'package:design_system/types/color_types.dart';
import 'package:design_system/types/space_type.dart';
import 'package:design_system/types/text_type.dart';

abstract class ThemeType {
  TextType textType();
  ColorTypes colorType();
  SpaceTypes spaceTypes();
}
