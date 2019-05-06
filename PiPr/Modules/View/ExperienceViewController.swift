//
//  ExperienceViewController.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    var careerHistory = [CareerHistory]()
    private let experiencePresenter = ExperiencePresenter()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        experiencePresenter.attachView(self)
        self.tableView.register(UINib.init(nibName: CustomCellsConstants.InfoCell, bundle: nil), forCellReuseIdentifier: CustomCellsConstants.InfoCellID)
        experiencePresenter.updateExperienceInformation()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}

extension ExperienceViewController: ExperienceViewProtocol {
    func getExperienceInformation() -> [CareerHistory]? {
        return (self.tabBarController  as? TabBarController)?.resumeInformation?.cv?.careerHistory
    }
    
    func updateExperienceView(careerHistory: [CareerHistory]) {
        self.careerHistory = careerHistory
    }
   
    func getEducationInformation() -> [Education]? {
        return (self.tabBarController  as? TabBarController)?.resumeInformation?.cv?.education
    }
}

extension ExperienceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiencePresenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellsConstants.InfoCellID) as? InformationViewCell else {
            return UITableViewCell()
        }
        
        if careerHistory.count > indexPath.row {
            cell.lblTitle.text = careerHistory[indexPath.row].companyName
            cell.lblSubtitle.text = careerHistory[indexPath.row].positionHeld
            cell.lblDate.text =
                (careerHistory[indexPath.row].period?.startDate ?? GeneralConst.emptyStr) + " - " + (careerHistory[indexPath.row].period?.endDate ?? GeneralConst.emptyStr)
            cell.lblDescription.text = careerHistory[indexPath.row].accomplishments
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
 
}
