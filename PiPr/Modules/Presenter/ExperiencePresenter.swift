//
//  ExperiencePresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

protocol ExperienceViewProtocol: NSObjectProtocol {
    func getExperienceInformation() -> [CareerHistory]?
    func updateExperienceView(careerHistory: [CareerHistory])
}

class ExperiencePresenter: NSObject {
    
    weak fileprivate var experienceView : ExperienceViewProtocol?
    
    func attachView(_ view:ExperienceViewProtocol){
        experienceView = view
    }
    
    func detachView() {
        experienceView = nil
    }
    
    func showExperience() {
        
    }
    
    func updateExperienceInformation() {
        guard let information = experienceView?.getExperienceInformation() else {
            return
        }
        experienceView?.updateExperienceView(careerHistory: information)
    }
    
    func getNumberOfRows() -> Int{
        
        if let array = experienceView?.getExperienceInformation() {
            return array.count
        }
        return 0
    }

}
