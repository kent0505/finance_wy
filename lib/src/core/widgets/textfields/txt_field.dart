import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatefulWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.number = false,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool number;
  final int length;
  final void Function() onChanged;

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  TextInputType? _keyboardType() {
    if (widget.number) return TextInputType.number;
    return null;
  }

  List<TextInputFormatter>? _inputFormatters() {
    final length = LengthLimitingTextInputFormatter(widget.length);
    final digit = FilteringTextInputFormatter.digitsOnly;
    if (widget.number) return [length, digit];
    return [length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: _keyboardType(),
        inputFormatters: _inputFormatters(),
        textCapitalization: TextCapitalization.sentences,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: Fonts.regular,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.14),
            fontFamily: Fonts.regular,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          widget.onChanged();
        },
      ),
    );
  }
}
