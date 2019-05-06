//
//  EducationPresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

protocol EducationViewProtocol: NSObjectProtocol {
    func getEducationInformation() -> [Education]?
    func updateEducationView(education: [Education])
}

class EducationPresenter: NSObject {
    
    weak fileprivate var educationView : EducationViewProtocol?
    
    func attachView(_ view:EducationViewProtocol){
        educationView = view
    }
    
    func detachView() {
        educationView = nil
    }
    
    func updateEducationInformation() {
        guard let information = educationView?.getEducationInformation() else {
            return
        }
        educationView?.updateEducationView(education: information)
    }
    
    func getNumberOfRows() -> Int{
        
        if let array = educationView?.getEducationInformation() {
            return array.count
        }
        return 0
    }

}
