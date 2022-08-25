import 'package:flutter/material.dart';
import 'package:design_system/types/space_type.dart';
import 'package:design_system/types/theme_type.dart';
import 'package:design_system/types/color_types.dart';
import 'package:design_system/types/text_type.dart';

class ShowsTheme implements ThemeType {
  @override
  TextType textType() => TextType(
        l1: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        l2: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        l3: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        l4: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w500,
        ),
        cardTitle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        cardSubTitle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );

  @override
  ColorTypes colorType() => ColorTypes(
        primary: const Color(0XFFE9E9E9),
        secondary: Colors.pink,
        auxiliary: Colors.amber,
      );

  @override
  SpaceTypes spaceTypes() => SpaceTypes(baseValue: 4);
}
