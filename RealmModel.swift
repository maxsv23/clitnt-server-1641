//
//	RealmModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import RealmSwift

class RealmModel : Object,Codable {

	@objc dynamic var response : Response = Response()


	enum CodingKeys: String, CodingKey {
		case response
	}
	convenience required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		response = try Response(from: decoder)
	}


}