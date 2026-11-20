import SwiftUI

struct PluginsView: View {
    @ObservedObject var store: PluginStore

    var body: some View {
        List {
            Section {
                Text("Plugin switches are a UI prototype. They do not load or execute plugin code.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
            Section("Plugin options") {
                ForEach(store.plugins) { plugin in
                    Toggle(isOn: Binding(
                        get: { store.plugins.first(where: { $0.id == plugin.id })?.isEnabled ?? false },
                        set: { _ in store.toggle(id: plugin.id) }
                    )) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(plugin.name)
                            Text(plugin.description).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Plugins")
    }
}
