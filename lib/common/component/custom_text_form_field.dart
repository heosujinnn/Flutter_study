import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String> onChanged;

  const CustomTextFormField({
    this.obscureText=false,
    this.autofocus=false,
    required this.onChanged,
    this.hintText,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: INPUT_BORDER_COLOR,
      width: 1.0,
    ));

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText, //비번
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(
            color: BODY_TEXT_COLOR,
            fontSize: 14,
          ),
          fillColor: INPUT_BG_COLOR,
          //false-배경색 없고, true-배경색 있음.
          filled: true,
          //모든 인풋 상태의 기본 스타일 셋팅
          border: baseBorder,
          enabledBorder: baseBorder,
          //포커스되면 포더사이즈만 바꿀건데 색상만 바굴거다.
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(color: PRIMARY_COLOR),
          ),
      ),
    );
  }
}
