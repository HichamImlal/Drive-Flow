# Drive Flow

Drive Flow is a Flutter car-rental application. Customers can browse cars,
search by make or model, book rentals, review rental history, manage their
profile, and locate the agency on a map. Administrators can manage their car
inventory and review rental details.

This repository contains the Flutter client. The backend API is not included
and must be running separately.

## Features

### Customer experience

- Splash and onboarding flow.
- Account registration and login.
- Role-based navigation after authentication.
- Browse available cars and search by make or model.
- View car details, rental dates, pricing, and availability.
- Book a car and view rental history.
- View agency information and location with Google Maps.
- Edit profile information, profile image, and security settings.

### Administrator experience

- Admin dashboard for managed vehicles.
- Add cars with make, model, price, description, and image.
- Edit and delete car listings.
- View rental details associated with the administrator.
- Manage the administrator profile.

## Technology

- Flutter and Dart.
- `provider` for user state.
- `http` for REST API requests.
- `google_maps_flutter` for maps.
- `image_picker` for profile and vehicle images.
- `crypto` for client-side SHA-256 password hashing.
- `google_nav_bar` and `smooth_page_indicator` for navigation and onboarding UI.
- Poppins fonts bundled in `assets/fonts/`.

## Requirements

Install the following before running the project:

- Flutter SDK with Dart SDK `>=3.3.0-174.3.beta <4.0.0`.
- Android Studio and an Android emulator or physical device for Android builds.
- Xcode and CocoaPods for iOS builds on macOS.
- A running Drive Flow backend API reachable from the device.
- A Google Maps API key for Android map functionality.

Check the local Flutter installation with:

```bash
flutter doctor
flutter --version
```

## Backend configuration

The API host is currently defined in `lib/constant.dart`:

```dart
String ipAddress = "<backend-host>";
```

The client builds requests against port `8080`, so the base URL should follow
this format:

```text
http://<backend-host>:8080
```

Change the address to the backend machine's LAN IP before running on another
network. When using an Android emulator, the address may need to be different
from the address used by a physical device. The backend must be reachable from
the device, not only from the development computer.

The client currently uses endpoints for:

- Authentication: login and registration.
- Cars: list, create, update, delete, image retrieval, and availability.
- Rentals: create rental, retrieve rental details, and update rental status.
- History: create and retrieve customer rental history.
- Users: update profile, security data, and profile images.

The exact request and response models are implemented in the Flutter screens
and widgets under `lib/user/` and `lib/admin/`.

## Google Maps setup

Android reads its Google Maps key from:

```text
android/app/src/main/AndroidManifest.xml
```

Replace the committed key with a restricted key managed through your local
Android configuration before distributing the app. The Maps feature also
requires the Google Maps SDK to be enabled for the Google Cloud project.

## Run the application

From the repository root:

```bash
flutter pub get
flutter devices
flutter run
```

To target a specific device:

```bash
flutter run -d <device-id>
```

The app starts at the splash screen. The available screens depend on the role
returned by the authentication backend: customers enter the bottom-navigation
experience, while administrators enter the admin dashboard.

## Project structure

```text
lib/
	main.dart                 Application entry point and route registration
	constant.dart             API host and shared colors
	class/                    Car, user, history, and rental data models
	user/
		controller/             Customer navigation controllers
		providers/              Shared customer state
		screens/                Customer screens
		Widgets/                Reusable customer widgets
	admin/
		screens/                Administrator screens
		Widgets/                Reusable administrator widgets
assets/
	fonts/                    Bundled Poppins font files
	images/                   Logos and application images
android/, ios/, macos/      Native platform projects
web/, windows/, linux/      Flutter desktop and web projects
test/                       Flutter widget tests
```

## Useful commands

```bash
flutter analyze
flutter test
flutter build apk
flutter build web
```

## Current limitations

- The backend service is not part of this repository.
- The API URL is hard-coded and uses plain HTTP; production deployments
	should use environment-specific configuration and HTTPS.
- User state is held in memory and is not persisted between app launches.
- The Android Maps API key is currently present in the manifest and should be
	replaced with a restricted, deployment-specific key.
- The existing widget test is still the default Flutter counter example and
	does not cover the Drive Flow screens or backend flows.
- iOS and web platform configuration may require additional Maps and network
	setup before those targets are ready for production use.

## Development notes

The application uses `ChangeNotifierProvider` at the root in `lib/main.dart`.
Routes are registered there, while feature-specific UI and HTTP calls are
organized under the customer and administrator folders. Keep backend contract
changes synchronized with the model classes and the screens that consume the
API responses.
