import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPageRoute {
  static PageRoute build({
    @required Widget Function(BuildContext) builder,
    @required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(builder: builder, settings: settings, fullscreenDialog: fullscreenDialog)
        : MaterialPageRoute(builder: builder, settings: settings, fullscreenDialog: fullscreenDialog);
  }
}
