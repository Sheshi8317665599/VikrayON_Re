# vikrayon

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// project structre with detail explanation

lib/
│── api/                   # API service handlers
│   ├── api_client.dart    # API base client
│   ├── auth_api.dart      # Authentication API calls
│   ├── product_api.dart   # Product-related API calls
│   ├── order_api.dart     # Orders API calls
│
│── controllers/           # GetX controllers for state management
│   ├── auth_controller.dart
│   ├── product_controller.dart
│   ├── cart_controller.dart
│   ├── order_controller.dart
│   ├── vendor_controller.dart
│   ├── driver_controller.dart
│
│── models/                # Data models
│   ├── user_model.dart
│   ├── product_model.dart
│   ├── cart_model.dart
│   ├── order_model.dart
│   ├── vendor_model.dart
│   ├── driver_model.dart
│
│── views/                 # UI Screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── forgot_password_screen.dart
│   │
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── category_screen.dart
│   │   ├── product_details_screen.dart
│   │   ├── cart_screen.dart
│   │   ├── checkout_screen.dart
│   │
│   ├── vendor/
│   │   ├── vendor_dashboard_screen.dart
│   │   ├── add_product_screen.dart
│   │   ├── order_management_screen.dart
│   │
│   ├── driver/
│   │   ├── driver_dashboard_screen.dart
│   │   ├── order_pickup_screen.dart
│   │   ├── delivery_tracking_screen.dart
│
│── utils/                 # Helper functions and constants
│   ├── app_constants.dart
│   ├── helpers.dart
│
│── routes/                # Navigation routes
│   ├── app_routes.dart
│
│── widgets/               # Reusable UI components
│   ├── custom_button.dart
│   ├── product_card.dart
│   ├── cart_item.dart
│
│── main.dart              # App entry point
│── pubspec.yaml           # Dependencies
│── README.md              # Documentation
