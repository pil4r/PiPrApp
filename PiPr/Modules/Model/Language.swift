//
//	Language.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Language : Codable {

	let language : String?
	let level : String?


	enum CodingKeys: String, CodingKey {
		case language = "language"
		case level = "level"
	}


}
