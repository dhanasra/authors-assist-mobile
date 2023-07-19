import 'package:flutter/material.dart';

import '../constants/colors_const.dart';
import '../resources/validator.dart';

class TextInput extends StatelessWidget {
  final String hintext;
  final String? suffixText;
  final TextEditingController controller;
  final String? validatorField;
  final bool isRequired;
  final bool validateEmail;
  final bool capitalize;
  final int maxLines;
  final bool validatePassword;
  const TextInput({
    super.key,
    required this.hintext,
    this.suffixText,
    this.maxLines = 1,
    required this.controller,
    this.isRequired = true,
    this.validatorField,
    this.capitalize = false,
    this.validateEmail = false,
    this.validatePassword = false  
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: capitalize ? TextCapitalization.sentences : TextCapitalization.none,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintext,
        suffixText: suffixText
      ),
      validator: (v)=>isRequired? Validator.validateNonNull(v, label: validatorField) : validateEmail 
        ? Validator.validateEmail(v, label: validatorField) : validatePassword
        ? Validator.validatePassword(v, label: validatorField) : null,
      style: Theme.of(context)
        .inputDecorationTheme
        .hintStyle!
        .copyWith(color: ColorsConst.text),
    );
  }
}