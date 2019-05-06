//
//  TabBarController.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let tabPresenter = TabBarPresenter(resumeService: ResumeService())
    var resumeInformation : Resume?

    override func viewDidLoad() {
        super.viewDidLoad()
        tabPresenter.attachView(self)
        tabPresenter.getInformation()
    }
}

extension TabBarController: TabBarViewProtocol {
    
    func setInformation(_ resume: Resume?) {
        resumeInformation = resume
        tabPresenter.notifyRetrievedImformation()
    }
    
}
