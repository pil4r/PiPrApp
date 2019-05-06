//
//  TabControlerPresenterTest.swift
//  PiPrTests
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/3/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import XCTest
@testable import PiPr

class ResumeServiceMock: ResumeService {
    fileprivate let information: Resume
    init(info: Resume) {
        self.information = info
    }
    
    override func getResume(informationRetrieved: @escaping (Resume?) -> ()) {
        informationRetrieved(information)
    }
    
}

class TabViewMock : NSObject, TabBarViewProtocol{
    var setInformationCalled = false
    var setEmptyInformationCalled = false
    
    func setInformation(_ resume: Resume?) {
        self.setInformationCalled = true
    }
    
    func setEmptyInformation() {
        self.setEmptyInformationCalled = true
    }
}

class UserPresenterTest: XCTestCase {
    
    let careerHistory1 = CareerHistory(accomplishments: "accomplishments1.1, \naccomplishments1.2", companyName: "Company 1", period: Period(endDate: "May 2016", startDate: "Dic 2015"), positionHeld: "Support 1")
    let careerHistory2 = CareerHistory(accomplishments: "accomplishments2.1, \naccomplishments2.2", companyName: "Company 2", period: Period(endDate: "May 2017", startDate: "Dic 2016"), positionHeld: "Support 2")
    let careerHistory3 = CareerHistory(accomplishments: "accomplishments3.1", companyName: "Company 3", period: Period(endDate: "May 2018", startDate: "Dic 2017"), positionHeld: "Support 2")
    let careerHistory4 = CareerHistory(accomplishments: "accomplishments4.1\naccomplishments4.2,\naccomplishments4.3\naccomplishments4.4, \naccomplishments4.4", companyName: "Company 4", period: Period(endDate: "May 2019", startDate: "Dic 2018"), positionHeld: "Support 2")
    
    var careerArray : [CareerHistory] = []
    
    let education1 = Education(degree: "University 1", period: Period(endDate: "2010", startDate: "2006"), universityName: "University 1")
    let education2 = Education(degree: "Mock Course contability 2", period: Period(endDate: "2010", startDate: "2009"), universityName: "University 2")
    let education3 = Education(degree: "Course Marketing 3", period: Period(endDate: "2011", startDate: "2010"), universityName: "University 3")
    
    var educationArray : [Education] = []
    
    let language1 = Language(language: "English", level: "Native Speaker")
    let language2 = Language(language: "German", level: "Advanced")
    
    var languages : [Language] = []
    
    let aditional1 = AditionalInformation(personalKey: "Age", personalVale: "30s")
    let aditional2 = AditionalInformation(personalKey: "Hair color", personalVale: "Brown")
    let aditional3 = AditionalInformation(personalKey: "Strenghths", personalVale: "Organization\nEnthusiasm\nCreativity\nDiscipline\nHonesty")
    
    var aditionals : [AditionalInformation] = []
    
    var personal : PersonalInformation?
    
    var cv : Cv?
    var resume : Resume?
    
    var emptyInfoServiceMock : ResumeServiceMock!
    var informationServiceMock : ResumeServiceMock!
    
    override func setUp() {
        super.setUp()
    }
    
    func initValues() {
        self.careerArray = [careerHistory1, careerHistory2, careerHistory3, careerHistory4]
        self.educationArray = [education1, education2, education3]
        self.languages = [language1, language2]
        self.aditionals = [aditional1, aditional2, aditional3]
        
        self.personal = PersonalInformation(aditionalInformation: aditionals, name: "Regina Fal", position: "Instructor")
        
        self.cv = Cv(careerHistory: careerArray, education: educationArray, languages: languages, personalInformation: personal, qualifications: [Qualification(qualification: "Qualification 1")])
        self.resume = Resume(cv: cv)
        
        self.emptyInfoServiceMock = ResumeServiceMock(info: Resume(cv: nil))
        self.informationServiceMock = ResumeServiceMock(info: Resume(cv: cv))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldSetInoformation() {
        
        self.initValues()
        
        let tabViewMock = TabViewMock()
        let tabPresenterUnderTest = TabBarPresenter(resumeService: informationServiceMock!)
        tabPresenterUnderTest.attachView(tabViewMock)

        tabPresenterUnderTest.getInformation()

        XCTAssertTrue(tabViewMock.setInformationCalled)
    }
    
}
