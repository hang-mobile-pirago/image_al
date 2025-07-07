part of 'utils.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get insetsBottom => MediaQuery.of(this).viewInsets.bottom;

  TextStyle style6({Color? color}) {
    return TextStyle(
      fontSize: 6,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }

  TextStyle style7() {
    return TextStyle(
      fontSize: 7,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle style8({FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.redAccent,
      fontSize: 8,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  TextStyle style9({bool isBold = false, Color? color, Color? shadowColor}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: 9,
      fontWeight: isBold ? FontWeight.bold : null,
      shadows: shadowColor == null
          ? null
          : <Shadow>[
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 1.0,
          color: shadowColor,
        ),
      ],
    );
  }

  TextStyle style10({
    bool isBold = false,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 10,
      fontWeight: isBold ? FontWeight.bold : fontWeight,
      color: color ?? Colors.black,
    );
  }

  TextStyle style11({
    bool isBold = false,
    Color? color,
    Color? shadowColor,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
        fontSize: 11,
        fontWeight: isBold ? FontWeight.bold : fontWeight,
        shadows: shadowColor == null
            ? null
            : <Shadow>[
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: shadowColor,
          ),
        ],
        color: color ?? Colors.black);
  }

  TextStyle styleTextNote(
      {bool isBold = false, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: isBold ? FontWeight.bold : null,
      color: color ??Colors.blue,
      decorationColor: Colors.blue,
      decoration: textDecoration,
    );
  }

  TextStyle style12(
      {bool isBold = false,
        Color? color,
        TextDecoration? textDecoration,
        FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: isBold ? FontWeight.bold : fontWeight,
      color: color ??Colors.blue,
      decorationColor: color ?? Colors.blueAccent,
      decoration: textDecoration,
    );
  }

  TextStyle style13({
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Colors.black,
      fontSize: 13,
      decoration: decoration,
    );
  }

  TextStyle style14({
    bool isBold = false,
    Color? color,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 14,
      fontWeight: isBold ? FontWeight.bold : fontWeight,
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle style15(
      {FontWeight? fontWeight,
        bool isBold = false,
        Color? color,
        TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 15,
      fontWeight: isBold ? FontWeight.bold : fontWeight,
      color: color ?? Colors.black,
      decoration: textDecoration,
    );
  }

  TextStyle styleTitleForm(
      {bool isBold = true, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: isBold ? FontWeight.bold : null,
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle style16({
    bool isBold = true,
    Color? color,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.w400),
      color: color ?? Colors.black,
      decoration: textDecoration,
    );
  }

  TextStyle style17({
    bool isBold = true,
    Color? color,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 17,
      fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.w400),
      color: color ?? Colors.black,
      decoration: textDecoration,
    );
  }

  TextStyle style19({
    bool isBold = true,
    Color? color,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 19,
      fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.w400),
      color: color ?? Colors.black,
      decoration: textDecoration,
    );
  }

  TextStyle style32(
      {bool isBold = true, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 32,
      fontWeight: isBold ? FontWeight.bold : null,
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle style20({
    bool isBold = true,
    Color? color,
    TextDecoration? textDecoration,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: 20,
      fontWeight: fontWeight ?? (isBold ? FontWeight.bold : null),
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle style28(
      {FontWeight? fontWeight, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle styleTitleScreen(
      {FontWeight? fontWeight, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color,
      decoration: textDecoration,
    );
  }

  TextStyle style24(
      {FontWeight? fontWeight, Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
      decoration: textDecoration,
    );
  }
}