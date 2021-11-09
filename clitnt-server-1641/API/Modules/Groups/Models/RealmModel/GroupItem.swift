//
//	GroupItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class GroupItem : Object,Codable {

	@objc dynamic var id : Int = Int()
	@objc dynamic var isAdmin : Int = Int()
	@objc dynamic var isAdvertiser : Int = Int()
	@objc dynamic var isClosed : Int = Int()
	@objc dynamic var isMember : Int = Int()
	@objc dynamic var name : String = String()
	@objc dynamic var photo100 : String = String()
	@objc dynamic var photo200 : String = String()
	@objc dynamic var photo50 : String = String()
	@objc dynamic var screenName : String = String()
	@objc dynamic var type : String = String()


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case isAdmin = "is_admin"
		case isAdvertiser = "is_advertiser"
		case isClosed = "is_closed"
		case isMember = "is_member"
		case name = "name"
		case photo100 = "photo_100"
		case photo200 = "photo_200"
		case photo50 = "photo_50"
		case screenName = "screen_name"
		case type = "type"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
		isAdmin = try values.decodeIfPresent(Int.self, forKey: .isAdmin) ?? 0
		isAdvertiser = try values.decodeIfPresent(Int.self, forKey: .isAdvertiser) ?? 0
		isClosed = try values.decodeIfPresent(Int.self, forKey: .isClosed) ?? 0
		isMember = try values.decodeIfPresent(Int.self, forKey: .isMember) ?? 0
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
		photo100 = try values.decodeIfPresent(String.self, forKey: .photo100) ?? ""
		photo200 = try values.decodeIfPresent(String.self, forKey: .photo200) ?? ""
		photo50 = try values.decodeIfPresent(String.self, forKey: .photo50) ?? ""
		screenName = try values.decodeIfPresent(String.self, forKey: .screenName) ?? ""
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
	}


}
