//
//	CareerHistory.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct CareerHistory : Codable {

	let accomplishments : String
	let companyName : String?
	let period : Period?
	let positionHeld : String?


	enum CodingKeys: String, CodingKey {
		case accomplishments = "accomplishments"
		case companyName = "company_name"
		case period
		case positionHeld = "position_held"
	}


}
