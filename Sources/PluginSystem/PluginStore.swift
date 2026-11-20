import Foundation
import Combine

@MainActor
final class PluginStore: ObservableObject {
    @Published private(set) var plugins: [PepePlugin] = [
        PepePlugin(id: "custom-themes", name: "Custom Themes", description: "Theme options placeholder", isEnabled: false),
        PepePlugin(id: "message-tools", name: "Message Tools", description: "Message tools placeholder", isEnabled: false),
        PepePlugin(id: "profile-enhancer", name: "Profile Enhancer", description: "Profile options placeholder", isEnabled: false)
    ]
    private let saveKey = "PepeGramPluginsEnabled"

    init() {
        let enabledIDs = Set(UserDefaults.standard.stringArray(forKey: saveKey) ?? [])
        for index in plugins.indices { plugins[index].isEnabled = enabledIDs.contains(plugins[index].id) }
    }

    func toggle(id: PepePlugin.ID) {
        guard let index = plugins.firstIndex(where: { $0.id == id }) else { return }
        plugins[index].isEnabled.toggle()
        UserDefaults.standard.set(plugins.filter(\.isEnabled).map(\.id), forKey: saveKey)
    }
}
