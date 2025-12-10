# TURUSA Logistics & Field Operations MVP

Portfolio-grade Flutter MVP uygulaması - Lojistik ve saha operasyonları için profesyonel mobil uygulama.



### Ekran Görüntüleri

<p align="center"> 

<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-27-34-79_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-27-27-36_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-27-39-12_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-27-49-68_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-27-56-61_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-28-15-33_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-28-24-74_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-28-31-00_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-28-37-15_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
<a href=""><img src="https://raw.githubusercontent.com/mahmut-salih-cicek/LogiTrack/main/logitrackSS/Screenshot_2025-12-10-12-28-49-45_143b81a2128d8037c2f5f14b667700cc.jpg" width="200px"></a>
</p>


---




## 🏗️ Mimari

Bu proje **Clean Architecture + MVVM** pattern'i kullanarak geliştirilmiştir:

```
lib/
├── app/                    # Uygulama konfigürasyonu
│   ├── di/                 # Dependency Injection (Riverpod)
│   ├── router/             # go_router konfigürasyonu
│   └── theme/              # Material 3 tema
├── core/                    # Core katmanı
│   ├── design/             # Design system (colors, typography, spacing)
│   ├── network/             # Dio client, interceptors, mock server
│   ├── storage/             # Secure storage, Drift database
│   ├── offline_sync/        # Offline-first sync engine
│   ├── error/               # Error handling
│   ├── utils/               # Utilities
│   ├── services/            # Platform services
│   └── widgets/             # Reusable widgets
└── features/                # Feature modülleri
    ├── auth/                # Authentication
    ├── loads/               # Load management
    ├── dispatcher_dashboard/ # Dispatcher features
    ├── driver_route/        # Driver route management
    ├── tracking/            # Location tracking
    ├── pod/                 # Proof of Delivery
    ├── incidents/           # Incident handling
    ├── uploads/             # Document uploads
    ├── pdf/                 # PDF generation
    ├── notifications/       # Push notifications
    ├── permissions/         # Permission management
    └── settings/            # Settings
```

### Katman Yapısı

Her feature modülü 3 katmandan oluşur:

- **Domain**: Entities, Repository interfaces, UseCases
- **Data**: DTOs, DataSources (Remote/Local), Repository implementations, Mappers
- **Presentation**: Pages, Widgets, Providers (Riverpod)

## 🚀 Kurulum

### Gereksinimler

- Flutter SDK 3.9.2+
- Dart SDK 3.9.2+
- Android Studio / Xcode
- Google Maps API Key

### Adımlar

1. **Repository'yi klonlayın:**
```bash
git clone <repository-url>
cd lojistik_application
```

2. **Bağımlılıkları yükleyin:**
```bash
flutter pub get
```

3. **Code generation çalıştırın:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Google Maps API Key ekleyin:**
   - Android: `android/app/src/main/AndroidManifest.xml` dosyasında `YOUR_GOOGLE_MAPS_API_KEY` değerini değiştirin
   - iOS: `ios/Runner/Info.plist` dosyasında `YOUR_GOOGLE_MAPS_API_KEY` değerini değiştirin

5. **Uygulamayı çalıştırın:**
```bash
flutter run
```

## 📱 Özellikler

### ✅ Tamamlanan Özellikler

- ✅ Authentication (Login/Logout)
- ✅ Clean Architecture + MVVM yapısı
- ✅ Offline-first database (Drift)
- ✅ Secure token storage
- ✅ Network layer (Dio + interceptors)
- ✅ Design system (Material 3)
- ✅ Router (go_router)
- ✅ Permissions management
- ✅ Settings page
- ✅ Seed data

### 🚧 Geliştirme Aşamasında

- 🚧 Dispatcher Dashboard
- 🚧 Driver Route Management
- 🚧 Location Tracking
- 🚧 POD (Proof of Delivery)
- 🚧 Incident Handling
- 🚧 Document Uploads
- 🚧 PDF Generation
- 🚧 Notifications (in-app)

## 🧪 Test Kullanıcıları

### Dispatcher
- Email: `dispatcher@turusa.com`
- Şifre: Herhangi bir şifre (mock authentication)

### Driver
- Email: `driver@turusa.com`
- Şifre: Herhangi bir şifre (mock authentication)

## 📋 Demo Senaryoları

### Senaryo 1: Driver Shift Başlatma
1. Driver olarak giriş yap
2. "Today Route" sayfasına git
3. "Start Shift" butonuna tıkla
4. Konum takibi başlar

### Senaryo 2: POD (Proof of Delivery) Oluşturma
1. Stop detay sayfasına git
2. "Arrive" butonuna tıkla
3. Paketleri tara (QR/Barcode)
4. Fotoğraf çek
5. İmza topla
6. "Complete Stop" butonuna tıkla

### Senaryo 3: Dispatcher Load Atama
1. Dispatcher olarak giriş yap
2. Dashboard'dan bir load seç
3. Driver'a ata
4. Canlı haritada takip et

## 🛠️ Teknolojiler

- **State Management**: Riverpod
- **Routing**: go_router
- **Network**: Dio
- **Database**: Drift (SQLite)
- **Storage**: flutter_secure_storage
- **Maps**: google_maps_flutter
- **Location**: geolocator
- **Barcode**: mobile_scanner
- **PDF**: pdf + printing
- **Crash**: sentry_flutter

## 📦 Paketler

Tüm bağımlılıklar `pubspec.yaml` dosyasında tanımlıdır. Ana paketler:

- `flutter_riverpod`: State management
- `go_router`: Navigation
- `dio`: HTTP client
- `drift`: Offline-first database
- `google_maps_flutter`: Maps
- `geolocator`: Location services
- `mobile_scanner`: QR/Barcode scanning
- `image_picker`: Photo capture
- `signature`: Signature capture
- `pdf` + `printing`: PDF generation
- `sentry_flutter`: Error tracking

## 🏛️ Mimari Prensipleri

1. **Clean Architecture**: Domain, Data, Presentation katmanları ayrılmış
2. **Repository Pattern**: Data source abstraction
3. **UseCase Pattern**: Business logic encapsulation
4. **Offline-First**: Tüm veriler önce local DB'ye yazılır
5. **Dependency Injection**: Riverpod providers
6. **Error Handling**: Result pattern ile type-safe error handling

## 📝 Notlar

- Mock server kullanılıyor (gerçek API yok)
- Offline-first yaklaşım: Tüm veriler local DB'de saklanır
- Sync engine: Network geldiğinde otomatik sync
- JWT token authentication
- Role-based access control (Dispatcher/Driver)

## 🔧 Geliştirme

### Code Generation

Drift ve JSON serialization için code generation gerekli:

```bash
flutter pub run build_runner watch
```

### Database Migration

Drift database migration'ları `app_database.dart` dosyasında tanımlı.

### Testing

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart
```

## 📄 Lisans

Bu proje portfolio amaçlı geliştirilmiştir.

## 👤 Geliştirici

TURUSA Logistics MVP - Portfolio Project

---

**Not**: Bu bir MVP projesidir. Production için ek optimizasyonlar ve testler gereklidir.
