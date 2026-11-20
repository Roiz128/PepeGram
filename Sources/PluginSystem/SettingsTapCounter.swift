import Foundation

@MainActor
final class SettingsTapCounter: ObservableObject {
    @Published private(set) var count = 0
    private let requiredTaps = 4


    func registerTap() -> Bool {
        count += 1
        if count >= requiredTaps {
            count = 0
            return true
        }
        return false
    }

    func reset() { count = 0 }
}
