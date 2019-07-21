@_exported import Foundation

public struct Wiki: Codable {
    public let name: String
    public let wordmark: String
    public let desc: String
}

extension Wiki {
    static func initial() -> Wiki {
        return Wiki(name: "", wordmark: "", desc: "")
    }
}

public struct WikiList: Codable {
    public let items: [Wiki]
}
