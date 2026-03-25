# Flutter Application Localization Guidelines

To ensure a seamless experience for our users across different languages, all developers must strictly adhere to the following localization rules. Our supported languages are currently English (`en`) and Arabic (`ar`).

## 1. No Hard-Coded Strings

**Rule:** Never write user-facing text directly into Dart files.

All text displayed in the UI (labels, buttons, error messages, tooltips, etc.) must be dynamically loaded. Hard-coded strings make it impossible to switch languages and make the app difficult to maintain.

* ❌ **Bad (Do not do this):**
    ```dart
    Text('Welcome to the app!')
    ```

* ✅ **Good:**
    ```dart
    Text(AppLocalizations.of(context)!.welcomeMessage)
    ```

---

## 2. Use ARB Files for All Translations

**Rule:** Every string must be defined in the Application Resource Bundle (`.arb`) files.

Whenever you need a new string, you must add it to both the English and Arabic `.arb` files.

* **File Locations:** Typically found in `lib/l10n/` (e.g., `app_en.arb` and `app_ar.arb`).
* **Key Naming Convention:** Use `camelCase` for keys. Keep them descriptive.

**Example: Adding a "Login" button string**

1.  **Update `app_en.arb` (English):**
    ```json
    {
      "loginButtonLabel": "Login",
      "@loginButtonLabel": {
        "description": "Label for the login button on the authentication screen"
      }
    }
    ```

2.  **Update `app_ar.arb` (Arabic):**
    ```json
    {
      "loginButtonLabel": "تسجيل الدخول"
    }
    ```
*(Note: Always ensure the keys match exactly between both files. The app will fail to compile if a key exists in English but is missing in Arabic, or vice versa.)*

---

## 3. Access Strings via `AppLocalizations`

**Rule:** Always use the generated `AppLocalizations` class to access your translated strings in the UI.

Once you add your strings to the `.arb` files and run the Flutter build (or let the Flutter tool auto-generate the classes), you must call them using the localized context.

**Implementation Example:**

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the generated AppLocalizations class
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // Using the localized string for the title
        title: Text(l10n.loginTitle), 
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          // Using the localized string for the button label
          child: Text(l10n.loginButtonLabel), 
        ),
      ),
    );
  }
}