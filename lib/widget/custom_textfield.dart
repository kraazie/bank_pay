import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final IconData? prefixIconData;
  final String? prefixIconImage;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final bool autoFocus;
  final int? maxLength;
  final bool enableInteractiveSelection;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? prefixText;
  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.validator,
    this.prefixIconData,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onSaved,
    this.controller,
    this.enabled = true,
    this.autoFocus = false,
    this.prefixIconImage,
    this.inputFormatters,
    this.maxLength,
    this.focusNode,
    this.onFieldSubmitted,
    this.enableInteractiveSelection = true,
    this.prefixText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            labelText ?? '',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        TextFormField(
          controller: controller != null ? controller : null,
          focusNode: focusNode != null ? focusNode : null,
          enabled: enabled,
          autofocus: autoFocus,
          enableInteractiveSelection: enableInteractiveSelection,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: prefixIconImage != null ? buildPrefixImage() : buildPrefixIcon(),
            suffixIcon: suffixIcon != null ? suffixIcon : null,
            fillColor: CustomColors.kTxtField,
            filled: true,
            // labelText: labelText,
            isDense: true,
            hintText: hintText,
            counterText: '',
            prefixText: prefixText != null ? prefixText : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: CustomColors.kBorderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: CustomColors.kDarkGreen),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: CustomColors.kBorderColor),
            ),
            labelStyle: TextStyle(
              color: CustomColors.kGreyText,
            ),
            hintStyle: TextStyle(
              color: CustomColors.kGrey,
            ),
          ),
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onSaved: onSaved != null ? onSaved : null,
          onFieldSubmitted: onFieldSubmitted != null ? onFieldSubmitted : null,
        ),
      ],
    );
  }

  Icon buildPrefixIcon() {
    return Icon(
      prefixIconData,
      color: CustomColors.kGrey,
      size: 25,
    );
  }

  Image buildPrefixImage() {
    return Image(
      image: AssetImage(prefixIconImage!),
      fit: BoxFit.scaleDown,
      height: 10,
      width: 10,
    );
  }
}
