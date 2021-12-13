//
//	PhotosSize.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class PhotosSize : Object,Codable {

	@objc dynamic var height : Int = Int()
	@objc dynamic var type : String = String()
	@objc dynamic var url : String = String()
	@objc dynamic var width : Int = Int()


	enum CodingKeys: String, CodingKey {
		case height = "height"
		case type = "type"
		case url = "url"
		case width = "width"
	}
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        
		height = try values.decodeIfPresent(Int.self, forKey: .height) ?? 0
		type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
		url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
		width = try values.decodeIfPresent(Int.self, forKey: .width) ?? 0
	}


}
