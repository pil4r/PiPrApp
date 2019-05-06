//
//	Period.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Period : Codable {

	let endDate : String?
	let startDate : String?


	enum CodingKeys: String, CodingKey {
		case endDate = "end_date"
		case startDate = "start_date"
	}
    
    


}
