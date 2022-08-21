import Foundation
struct Language : Codable, Identifiable, Hashable {
    var id: String { return code }
    var code: String
    var name: String

}
