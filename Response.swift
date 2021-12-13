//
//	Response.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class Response : Object,Codable {

	@objc dynamic var count : Int = Int()
	@objc dynamic var items : [Item] = [Item]()


	enum CodingKeys: String, CodingKey {
		case count = "count"
		case items = "items"
	}
	convenience required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		items = try values.decodeIfPresent([Item].self, forKey: .items)
	}


}