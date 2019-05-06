//
//	AditionalInformation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct AditionalInformation : Codable {

	let personalKey : String?
	let personalVale : String?


	enum CodingKeys: String, CodingKey {
		case personalKey = "personal_key"
		case personalVale = "personal_vale"
	}


}
