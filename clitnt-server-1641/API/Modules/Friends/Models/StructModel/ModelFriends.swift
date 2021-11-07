import Foundation

// MARK: - Welcome
struct ModelFriends: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let firstName: String
    let id: Int
    let lastName: String
    let photo50: String
    let nickname, trackCode: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case nickname
        case trackCode = "track_code"
    }
}
