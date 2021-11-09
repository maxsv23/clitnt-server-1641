//
//	PhotosLike.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class PhotosLike : Object,Codable {

	@objc dynamic var count : Int = Int()
	@objc dynamic var userLikes : Int = Int()


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case userLikes = "user_likes"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
		userLikes = try values.decodeIfPresent(Int.self, forKey: .userLikes) ?? 0
	}


}
