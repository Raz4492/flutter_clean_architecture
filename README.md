# My Flutter App

This is a Flutter application that fetches user information from a dummy API and displays it on the screen.

## Features

- Fetches user information from a dummy API.
- Displays user information including name, username, email, phone, and website.

## Installation

1. Clone this repository to your local machine using `git clone`.
2. Make sure you have Flutter installed. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).
3. Navigate to the project directory in your terminal.
4. Run `flutter pub get` to install dependencies.
5. Run `flutter run` to start the application on your connected device or emulator.

## Folder Structure
```yaml
lib/
  |- core/
  |   |- errors/
  |   |   |- app_error.dart
  |   |- constants/
  |   |   |- app_constants.dart
  |   |- utils/
  |       |- app_utils.dart
  |
  |- domain/
  |   |- entities/
  |   |   |- user.dart
  |   |- repositories/
  |   |   |- user_repository.dart
  |   |- usecases/
  |       |- get_user_info.dart
  |
  |- data/
  |   |- repositories_impl/
  |   |   |- user_repository_impl.dart
  |   |- datasources/
  |       |- user_api.dart
  |
  |- presentation/
  |   |- screens/
  |   |   |- user_info_screen.dart
  |   |- widgets/
  |   |- blocs/
  |       |- user_info_bloc.dart
  |
  |- main.dart
```
