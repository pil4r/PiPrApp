//
//  AboutPresenter.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

protocol AboutViewProtocol: NSObjectProtocol {
    func getPersonalInformation() -> PersonalInformation?
    func updateView (personalInformation: PersonalInformation)
}

class AboutPresenter: NSObject {
    
    weak fileprivate var aboutView : AboutViewProtocol?
    
    func attachView(_ view:AboutViewProtocol){
        aboutView = view
    }
    
    func detachView() {
        aboutView = nil
    }
    
    func updateInformation() {
        
        guard let information = aboutView?.getPersonalInformation() else {
            return
        }
        aboutView?.updateView(personalInformation: information)
        
    }
    
    func getNumberOfRows() -> Int{
        
        if let array = aboutView?.getPersonalInformation()?.aditionalInformation {
            return array.count
        }
        return 0
    }
    
    func getInfoForRow(index: Int) -> AditionalInformation? {

        guard let info = aboutView?.getPersonalInformation()?.aditionalInformation, info.count > index else {
            return nil
        }
        return info[index]
    }
    
}
