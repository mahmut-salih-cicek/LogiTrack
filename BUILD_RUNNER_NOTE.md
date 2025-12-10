# Build Runner Notu

Bu projede Drift ve JSON serialization için code generation gereklidir.

## Çalıştırılması Gereken Komut

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Generate Edilecek Dosyalar

- `lib/core/storage/database/app_database.g.dart`
- `lib/core/storage/database/daos/*.g.dart` (tüm DAO'lar için)
- `lib/features/**/data/models/*_dto.g.dart` (tüm DTO'lar için)

## Generate Edilecek Type'lar

- `Load`, `Stop`, `Pod`, `Incident`, `UploadTask`, `SyncQueueItem` (database data classes)
- `LoadsCompanion`, `StopsCompanion`, vb. (insert/update companions)
- DTO'lar için `fromJson`/`toJson` metodları

Bu dosyalar generate edilmeden proje çalışmayacaktır.

