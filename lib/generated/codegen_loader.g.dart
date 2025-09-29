// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "explore": "استكشف",
  "travel": "سفر",
  "technology": "تقنية",
  "business": "اعمال",
  "entertainment": "ترفية",
  "cansel": "الغاء",
  "search_result": "نتيجة البحث",
    "no_results" : "لا توجد بيانات"
};
static const Map<String,dynamic> _en = {
  "explore": "Explore",
  "travel": "Travel",
  "technology": "Technology",
  "business": "Business",
  "entertainment": "Entertainment",
  "cansel": "Cancel",
  "search_result": "Search Result",
  "no_results" : "No Results"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
