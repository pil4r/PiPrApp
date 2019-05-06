//
//	PersonalInformation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct PersonalInformation : Codable {

	let aditionalInformation : [AditionalInformation]?
	let name : String?
	let position : String?
    let about : String?


	enum CodingKeys: String, CodingKey {
		case aditionalInformation = "aditional_information"
		case name = "name"
		case position = "position"
        case about = "about"
	}


}
