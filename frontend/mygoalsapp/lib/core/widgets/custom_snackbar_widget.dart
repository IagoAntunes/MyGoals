// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TypeSnackBar {
  SUCCESS,
  WARNING,
  ERROR,
  INFO,
}

abstract class IDefaultSnackBar {
  String? title;
  IconData? icon;
  Color? backgroundColor;
  TypeSnackBar typeSnackBar;
  IDefaultSnackBar({
    this.title,
    this.icon,
    this.backgroundColor,
    required this.typeSnackBar,
  }) {
    switch (typeSnackBar) {
      case TypeSnackBar.ERROR:
        backgroundColor = backgroundColor ?? const Color(0xffbb0202);
        title = title ?? "Erro";
        icon = icon ?? Icons.error;
        break;
      case TypeSnackBar.SUCCESS:
        backgroundColor = backgroundColor ?? const Color(0xff29E0A9);
        title = title ?? "Sucesso";
        icon = icon ?? Icons.check_circle;
        break;
      case TypeSnackBar.WARNING:
        backgroundColor = backgroundColor ?? Colors.amber;
        title = title ?? "Atenção";
        icon = icon ?? Icons.warning_rounded;
        break;
      case TypeSnackBar.INFO:
        backgroundColor = backgroundColor ?? Colors.blue;
        title = title ?? "Atenção";
        icon = icon ?? Icons.info_outline_rounded;
        break;
      default:
    }
  }
}

class SimpleSnackbars extends IDefaultSnackBar {
  SimpleSnackbars({
    super.title,
    super.backgroundColor,
    super.icon,
    required super.typeSnackBar,
  });
  factory SimpleSnackbars.success({String? title}) {
    return SimpleSnackbars(
      title: title,
      typeSnackBar: TypeSnackBar.SUCCESS,
    );
  }
  factory SimpleSnackbars.error({String? title}) {
    return SimpleSnackbars(
      title: title,
      typeSnackBar: TypeSnackBar.ERROR,
    );
  }
  factory SimpleSnackbars.warning({String? title}) {
    return SimpleSnackbars(
      title: title,
      typeSnackBar: TypeSnackBar.WARNING,
    );
  }
  factory SimpleSnackbars.info({String? title, Color? backgroundColor}) {
    return SimpleSnackbars(
      title: title,
      backgroundColor: backgroundColor,
      typeSnackBar: TypeSnackBar.WARNING,
    );
  }
}

class BigSnackbars extends IDefaultSnackBar {
  String subtitle;
  BigSnackbars({
    required this.subtitle,
    super.title,
    super.backgroundColor,
    super.icon,
    required super.typeSnackBar,
  });

  factory BigSnackbars.success() {
    return BigSnackbars(
      subtitle: "Sucesso",
      typeSnackBar: TypeSnackBar.SUCCESS,
    );
  }
  factory BigSnackbars.error() {
    return BigSnackbars(
      typeSnackBar: TypeSnackBar.ERROR,
      subtitle: "Ocorreu um problema!",
    );
  }
  factory BigSnackbars.warning() {
    return BigSnackbars(
      subtitle: "Atenção",
      typeSnackBar: TypeSnackBar.WARNING,
    );
  }
}

class CustomSnackBarModel {}

class AppSnackBars {
  static void showSimpleSnackBar(
      BuildContext context, SimpleSnackbars typeSnack) async {
    if (typeSnack.typeSnackBar == TypeSnackBar.ERROR) {
      typeSnack.backgroundColor = Theme.of(context).colorScheme.error;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: typeSnack.backgroundColor,
        padding: EdgeInsets.zero,
        content: SizedBox(
          child: ListTile(
            title: Text(
              typeSnack.title!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            leading: Icon(
              typeSnack.icon,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static void showBigSnackBar(
      BuildContext context, BigSnackbars typeSnack) async {
    //0xffba1a1a
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: typeSnack.backgroundColor,
        padding: EdgeInsets.zero,
        content: SizedBox(
          child: ListTile(
            title: Text(
              typeSnack.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            subtitle: Text(
              typeSnack.subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            leading: Icon(
              typeSnack.icon,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
