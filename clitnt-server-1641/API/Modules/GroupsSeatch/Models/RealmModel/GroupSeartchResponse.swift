//
//	GroupSeartchResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class GroupSeartchResponse : Object,Codable {

	@objc dynamic var count : Int = Int()
	dynamic var items = List<GroupSeartchItem>()


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case items = "items"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
		items = try values.decodeIfPresent(List<GroupSeartchItem>.self, forKey: .items)!
	}


}
