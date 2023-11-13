import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hint;
  final bool? isEnable;
  final TextInputType? inputType;
  final bool isMultiline;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final FocusNode? focusNode;
  final double? fontSize;
  final Color? fontColor;
  final bool? obscure;
  final TextAlign? textAlign;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTapPassword;

  const PasswordFormField(
      {Key? key,
        this.height,
        this.width,
        this.hint,
        this.isEnable,
        this.inputType,
        this.isMultiline = false,
        this.maxLength,
        this.controller,
        this.onChanged,
        this.onSubmit,
        this.focusNode,
        this.fontSize,
        this.fontColor,
        this.obscure,
        this.textAlign,
        this.padding,
        this.onTapPassword, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: isEnable,
              focusNode: focusNode,
              maxLength: maxLength,
              textAlign: textAlign ?? TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: hint,
                  counterText: "",
                  isCollapsed: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  hintStyle: const TextStyle(color: Color(0xff8d8d8d), fontSize: 14),
                  hintMaxLines: isMultiline ? null : 2,
                  suffixIcon: PasswordVisibility(onTap: () => onTapPassword?.call()),
                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 24,
                    minWidth: 24,
                  ),
                  fillColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 4)),
              style: TextStyle(
                color: fontColor ?? Colors.black,
                fontSize: fontSize ?? 14,
              ),
              obscureText: obscure ?? false,
              keyboardType: inputType ?? TextInputType.visiblePassword,
              onChanged: onChanged,
              onFieldSubmitted: onSubmit,
              maxLines: isMultiline ? null : 1,
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordVisibility extends StatefulWidget {

  final Function? onTap;

  const PasswordVisibility({Key? key, this.onTap}) : super(key: key);

  @override
  State<PasswordVisibility> createState() => _PasswordVisibilityState();
}

class _PasswordVisibilityState extends State<PasswordVisibility> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(200),
      onTap: () {
        setState(() => isVisible = !isVisible);
        widget.onTap?.call();
      },
      child: Icon(
        !isVisible? Icons.visibility: Icons.visibility_off,
        size: 24,
      ),
    );
  }
}