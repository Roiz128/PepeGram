# Integration notes (prototype only)

This starter is a small SwiftUI settings prototype. The switches save enabled IDs in UserDefaults; they do **not** load, install, or execute plugin code.

1. Copy `Sources/PluginSystem/` into the actual iOS app target's source tree (not merely into GitHub folders).
2. Ensure the four Swift files are included in the app target's Compile Sources/build membership.
3. Create a `PluginStore` in the settings screen's owning view and pass it into `PluginsView(store:)`.
4. For the four-tap counter, call `registerTap()` from the settings entry's tap handler. When it returns `true`, navigate to the Plugins screen. Reset behavior is included.
5. This is not a complete Telegram/PepeGram patch and cannot be built into an IPA without the full app source, Apple build environment, and signing setup.
