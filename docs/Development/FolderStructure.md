# Folder Structure

This document explains the folder structure of the project.

## `lib/`

This directory contains all the Dart code for the application.

### `lib/main.dart`

This is the entry point of the application. It contains the `main()` function that runs the app.

### `lib/src/`

This directory contains the source code of the application, divided into the following subdirectories:

#### `lib/src/app/`

This directory contains the root widget of the application (`MyApp`), which is responsible for setting up the theme and the home page.

#### `lib/src/core/`

This directory contains shared code that can be used by multiple features, such as:

*   **Constants:** Application-wide constants.
*   **Utils:** Utility functions.
*   **Widgets:** Shared custom widgets.

#### `lib/src/features/`

This directory contains the different features of the application. Each feature is a self-contained module with its own UI, logic, and data models.

A typical feature directory has the following structure:

*   **`application/`**: Contains the business logic of the feature (e.g., services, controllers).
*   **`domain/`**: Contains the data models and entities related to the feature.
*   **`presentation/`**: Contains the UI of the feature, divided into:
    *   **`view/`**: The main screens or pages of the feature.
    *   **`widgets/`**: Custom widgets used only within this feature.

#### `lib/src/routing/`

This directory contains the application's routing logic, using a package like `go_router` or Flutter's built-in navigation.

## `test/`

This directory contains all the tests for the application.
