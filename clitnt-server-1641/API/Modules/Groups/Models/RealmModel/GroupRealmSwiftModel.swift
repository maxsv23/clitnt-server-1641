//
//	GroupRealmSwiftModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class GroupRealmSwiftModel : Object,Codable {

	@objc dynamic var response : GroupResponse?


	enum CodingKeys: String, CodingKey {
		case response
	}

}
