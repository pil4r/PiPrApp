//
//	Cv.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Cv : Codable {

	let careerHistory : [CareerHistory]?
	let education : [Education]?
	let languages : [Language]?
	let personalInformation : PersonalInformation?
	let qualifications : [Qualification]?


	enum CodingKeys: String, CodingKey {
		case careerHistory = "career_history"
		case education = "education"
		case languages = "languages"
		case personalInformation = "personal_information"
		case qualifications = "qualifications"
	}


}
