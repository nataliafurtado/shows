import 'package:design_system/atom/button/icon_button_widget.dart';
import 'package:design_system/atom/text_field.dart/text_field_widget.dart';
import 'package:design_system/layout/default_padding.dart';
import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class TextFieldButtonWidget extends StatefulWidget {
  const TextFieldButtonWidget({
    Key? key,
    required this.onButtonClick,
    this.hint,
  }) : super(key: key);

  final Function onButtonClick;
  final String? hint;
  @override
  State<TextFieldButtonWidget> createState() => _TextFieldButtonWidgetState();
}

class _TextFieldButtonWidgetState extends State<TextFieldButtonWidget> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return SidesPadding(
      padding: sp.s4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFieldWidget(
              textController: textController,
              hint: widget.hint,
            ),
          ),
          SizedBox(width: sp.s4),
          IconButtonWidget(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                widget.onButtonClick(
                  textController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
