import 'package:flutter/material.dart';
part 'extensions.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey();

void unFocus() => FocusManager.instance.primaryFocus?.unfocus();
