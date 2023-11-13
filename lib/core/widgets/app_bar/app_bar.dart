import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_typography.dart';

class CustomAppBar {
  static PreferredSizeWidget titled({
    Color? titleColor,
    String? title,
    List<Widget>? actions,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      title: Text(
        title ?? "",
        style: AppTypography.copyWith(
          size: 18,
          weight: FontWeight.w700,
          color: titleColor ?? Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: Colors.blue,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      actions: actions ?? [],
    );
  }

  static PreferredSizeWidget backBtn({
    String? title,
    double? elevation,
    Function()? onBackPressed}) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      title: Text(
        title ?? "",
        style: AppTypography.copyWith(
          size: 18,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: Colors.blue,
      elevation: elevation ?? 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: BackButton(
        onPressed: onBackPressed,
        color: Colors.white,
      ),
    );
  }

  static PreferredSizeWidget backBtnNoTitle({
    Color? color,
    double? height,
    double? elevation,
    Function()? onBackPressed,
    List<Widget>? actions,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      elevation: elevation ?? 0.0,
      toolbarHeight: height,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: BackButton(
        onPressed: onBackPressed,
        color: Colors.white,
      ),
      actions: actions ?? [],
    );
  }
}