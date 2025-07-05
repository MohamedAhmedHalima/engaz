import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MyImageCacheManager {
  static final instance = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(minutes: 1),    // احتفظ بالصور 3 أيام فقط
      maxNrOfCacheObjects: 1,                // حد أقصى 100 صورة
    ),
  );
}
