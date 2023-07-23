import 'package:flutter/material.dart';

import '../resources/validator.dart';

class TextInput extends StatelessWidget {
  final String hintext;
  final String? suffixText;
  final String? labelText;
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
    this.labelText,
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
        labelText: labelText,
        alignLabelWithHint: true,
        suffixText: suffixText
      ),
      validator: (v)=>isRequired? Validator.validateNonNull(v, label: validatorField) : validateEmail 
        ? Validator.validateEmail(v, label: validatorField) : validatePassword
        ? Validator.validatePassword(v, label: validatorField) : null,
      style: Theme.of(context)
        .inputDecorationTheme
        .hintStyle!
        .copyWith(
          color: Theme.of(context).appBarTheme.foregroundColor,
          height: maxLines>1 ? 1.5 : 1 
        ),
    );
  }
}