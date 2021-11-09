//
//	PhotosItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class PhotosItem : Object,Codable {

	@objc dynamic var albumId : Int = Int()
	@objc dynamic var date : Int = Int()
	@objc dynamic var hasTags : Bool = Bool()
	@objc dynamic var id : Int = Int()
    @objc dynamic var likes: PhotosLike?
	@objc dynamic var ownerId : Int = Int()
	@objc dynamic var realOffset : Int = Int()
    @objc dynamic var reposts: PhotosRepost?
	dynamic var sizes = List<PhotosSize>()
	@objc dynamic var text : String = String()


	enum CodingKeys: String, CodingKey {
		case albumId = "album_id"
		case date = "date"
		case hasTags = "has_tags"
		case id = "id"
		case likes
		case ownerId = "owner_id"
		case realOffset = "real_offset"
		case reposts
		case sizes = "sizes"
		case text = "text"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		albumId = try values.decodeIfPresent(Int.self, forKey: .albumId) ?? 0
		date = try values.decodeIfPresent(Int.self, forKey: .date) ?? 0
        hasTags = try values.decodeIfPresent(Bool.self, forKey: .hasTags) ?? false
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
		likes = try PhotosLike(from: decoder)
		ownerId = try values.decodeIfPresent(Int.self, forKey: .ownerId) ?? 0
		realOffset = try values.decodeIfPresent(Int.self, forKey: .realOffset) ?? 0
		reposts = try PhotosRepost(from: decoder)
		sizes = try values.decodeIfPresent(List<PhotosSize>.self, forKey: .sizes)!
		text = try values.decodeIfPresent(String.self, forKey: .text) ?? ""
	}


}
