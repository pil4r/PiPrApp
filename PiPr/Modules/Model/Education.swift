//
//	Education.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Education : Codable {

	let degree : String?
	let period : Period?
	let universityName : String?


	enum CodingKeys: String, CodingKey {
		case degree = "degree"
		case period
		case universityName = "university_name"
	}


}
