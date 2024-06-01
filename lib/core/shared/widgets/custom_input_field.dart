// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:neu_normal/core/constants/app_constants.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  CustomInputField(
      {super.key,
      this.label,
      required this.is_obscure,
      this.prefixIcon,
      this.suffix,
      required this.textEditingController,
      this.hintText,
      this.suffixFunction,
      this.maxLines});
  final String? label;
  final Function()? suffixFunction;
  Icon? prefixIcon;
  Icon? suffix;
  final String? hintText;
  final TextEditingController textEditingController;
  bool is_obscure;
  int? maxLines;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final AppColorsTheme _appColorsTheme = AppColorsTheme.light();

  bool _default_obscure = true; // Initialize the password as obscured

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,

      /// Obscure text if textfield should be obscure, defined by the user and default obscure is true
      obscureText: widget.is_obscure && _default_obscure,
      decoration: InputDecoration(
        fillColor: Colors.white,

        prefixIcon: widget.prefixIcon != null
            ? GestureDetector(
                onTap: () {},
                child: widget.prefixIcon,
              )
            : null,

        /// Only show the visibility icon if obscure setting is true
        suffix: Visibility(
          visible: widget.is_obscure,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _default_obscure = !_default_obscure;
              });
            },
            child: Icon(
              _default_obscure ? Icons.visibility : Icons.visibility_off,
              color: _appColorsTheme.highlight,
            ),
          ),
        ),
        suffixIcon: widget.suffix != null
            ? GestureDetector(
                onTap: widget.suffixFunction, child: widget.suffix)
            : null,
        labelStyle: TextStyle(color: _appColorsTheme.highlight),
        labelText: widget.label,
        hintText: widget.hintText,
        iconColor: _appColorsTheme.highlight,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _appColorsTheme.highlight),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
      ),
      cursorColor: _appColorsTheme.highlight,
      controller: widget.textEditingController,
    );
  }
}
