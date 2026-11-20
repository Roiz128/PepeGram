import Foundation

struct PepePlugin: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let description: String
    var isEnabled: Bool
}
