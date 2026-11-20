import SwiftUI

struct PluginsView: View {
    @ObservedObject var store: PluginStore

    var body: some View {
        List {
            Section {
                Text("Управляй дополнительными функциями PepeGram.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            Section("Установленные плагины") {
                ForEach(store.plugins) { plugin in
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(plugin.name)
                                .font(.headline)

                            Text(plugin.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Toggle(
                            plugin.name,
                            isOn: Binding(
                                get: { plugin.isEnabled },
                                set: { _ in store.toggle(plugin) }
                            )
                        )
                        .labelsHidden()
                    }
                    .padding(.vertical, 4)
                }
            }

            Section {
                Text("Плагины управляют дополнительными настройками приложения. Включение переключателя активирует соответствующий модуль, если он реализован.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Plugins")
    }
}
