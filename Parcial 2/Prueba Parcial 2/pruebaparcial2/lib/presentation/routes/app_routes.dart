import 'package:flutter/material.dart';

class AppRoutes {
  static const String initial = '/';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      initial: (_) => const SizedBox(),
    };
  }
}