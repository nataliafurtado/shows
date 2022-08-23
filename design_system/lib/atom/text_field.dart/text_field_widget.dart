import 'package:design_system/theme_style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.textController,
    this.hint,
  }) : super(key: key);

  final TextEditingController textController;
  final String? hint;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    return TextField(
      controller: widget.textController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: sp.s4),
        alignLabelWithHint: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sp.s7),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(sp.s4),
        fillColor: ThemeStyle.themeType.colorType().primary,
        suffixIcon: widget.textController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  widget.textController.clear();
                  setState(() {});
                },
                icon: Icon(
                  Icons.clear,
                  color: ThemeStyle.themeType.colorType().secondary,
                ),
              )
            : null,
      ),
      onChanged: (text) {
        setState(() {});
      },
    );
  }
}
