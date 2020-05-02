import 'package:doppio_dev_site/generated/l10n.dart';

class TranslateService {
  static final _translateServiceSingleton = TranslateService._internal();

  S locale;
  String _language;
  String get language => _language ?? '';

  factory TranslateService() {
    return _translateServiceSingleton;
  }
  TranslateService._internal();
}
