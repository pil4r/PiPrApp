//
//  EducationViewController.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var educationHistory = [Education]()
    private let educationPresenter = EducationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        educationPresenter.attachView(self)
        self.tableView.register(UINib.init(nibName: CustomCellsConstants.InfoCell, bundle: nil), forCellReuseIdentifier: CustomCellsConstants.InfoCellID)
        educationPresenter.updateEducationInformation()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}

extension EducationViewController: EducationViewProtocol {
    func updateEducationView(education: [Education]) {
        self.educationHistory = education
    }
    
    func getEducationInformation() -> [Education]? {
        return (self.tabBarController  as? TabBarController)?.resumeInformation?.cv?.education
    }
}

extension EducationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return educationPresenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellsConstants.InfoCellID) as? InformationViewCell else {
            return UITableViewCell()
        }
        
        if educationHistory.count > indexPath.row {
            cell.lblTitle.text = educationHistory[indexPath.row].universityName
            cell.lblSubtitle.text = educationHistory[indexPath.row].degree
            cell.lblDate.text =
                (educationHistory[indexPath.row].period?.startDate ?? GeneralConst.emptyStr) + " - " +  (educationHistory[indexPath.row].period?.endDate ?? GeneralConst.emptyStr)
            cell.subtitleToDescriptionConstraint.constant = 0
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
