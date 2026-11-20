# PepeGram iOS starter project

This is a minimal SwiftUI/Xcode starter so GitHub Actions can compile a basic iOS app.

**It is not the original Telegram/PepeGram app and does not include your plugin implementation.** The plugin toggle and counter are demo UI only.

## Build
GitHub Actions workflow `.github/workflows/ios.yml` builds an unsigned app on a macOS runner and uploads the `.app` bundle as an artifact. An unsigned build is not directly installable on an iPhone; signing/provisioning is required for installation.
