import SwiftUI

struct PluginsHomeView: View {
    @State private var pluginsEnabled = false
    @State private var tapCount = 0

    var body: some View {
        NavigationStack {
            List {
                Section("Plugin system starter") {
                    Toggle("Enable plugin interface", isOn: $pluginsEnabled)
                    Text(pluginsEnabled ? "Interface enabled (demo only)" : "Interface disabled")
                        .foregroundStyle(.secondary)
                }
                Section("Example plugin") {
                    Button("Tap counter: \(tapCount)") { tapCount += 1 }
                    Text("This is a UI prototype. It does not load or execute external plugins.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("PepeGram")
        }
    }
}
