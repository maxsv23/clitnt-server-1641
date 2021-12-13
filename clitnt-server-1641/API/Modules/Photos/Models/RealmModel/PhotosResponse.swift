//
//	PhotosResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class PhotosResponse : Object,Codable {

	@objc dynamic var count : Int = Int()
	dynamic var items = List<PhotosItem>()
	@objc dynamic var more : Int = Int()


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case items = "items"
		case more = "more"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
		items = try values.decodeIfPresent(List<PhotosItem>.self, forKey: .items)!
		more = try values.decodeIfPresent(Int.self, forKey: .more) ?? 0
	}


}
