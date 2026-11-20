import Foundation

final class PluginStore: ObservableObject {
    @Published var plugins: [PepePlugin] = [
        PepePlugin(
            id: "custom-themes",
            name: "Custom Themes",
            description: "Настройка оформления",
            isEnabled: false
        ),
        PepePlugin(
            id: "message-tools",
            name: "Message Tools",
            description: "Дополнительные инструменты сообщений",
            isEnabled: false
        ),
        PepePlugin(
            id: "profile-enhancer",
            name: "Profile Enhancer",
            description: "Дополнительные настройки профиля",
            isEnabled: false
        )
    ]

    private let saveKey = "PepeGramPluginsEnabled"

    init() {
        let saved = UserDefaults.standard.stringArray(forKey: saveKey) ?? []

        for index in plugins.indices {
            plugins[index].isEnabled = saved.contains(plugins[index].id)
        }
    }

    func toggle(_ plugin: PepePlugin) {
        guard let index = plugins.firstIndex(where: { $0.id == plugin.id }) else {
            return
        }

        plugins[index].isEnabled.toggle()
        save()
    }

    private func save() {
        let enabled = plugins
            .filter { $0.isEnabled }
            .map { $0.id }

        UserDefaults.standard.set(enabled, forKey: saveKey)
    }
}
