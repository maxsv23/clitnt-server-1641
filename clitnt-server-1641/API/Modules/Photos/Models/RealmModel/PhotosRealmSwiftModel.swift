//
//	PhotosRealmSwiftModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class PhotosRealmSwiftModel : Object,Codable {

	@objc dynamic var response : PhotosResponse?

	enum CodingKeys: String, CodingKey {
		case response
	}

    override class func shouldIncludeInDefaultSchema() -> Bool {
       return false
    }

}
