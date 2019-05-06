//
//  AboutViewController.swift
//  PiPr
//
//  Created by Pilar Del Rosario Prospero Zeferino on 5/2/19.
//  Copyright © 2019 Pil. All rights reserved.
//

import UIKit
import Foundation

class AboutViewController: UIViewController {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    var personalInformation:PersonalInformation?
    private let aboutPresenter = AboutPresenter()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgViewProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: CustomCellsConstants.dataViewCell, bundle: nil), forCellReuseIdentifier: CustomCellsConstants.dataViewCellID)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        NotificationCenter.default.addObserver(self,
                                       selector: #selector(updateInformation),
                                       name: .informationWasRetrieved
            ,
                                       object: nil
        )
        
        aboutPresenter.attachView(self)
    }
    
    @objc func updateInformation() {
        aboutPresenter.updateInformation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    func setupView() {
        self.imgViewProfile.layer.cornerRadius = self.imgViewProfile.frame.width/2
        self.imgViewProfile.layer.borderColor = UIColor.white.cgColor
        self.imgViewProfile.layer.borderWidth = 1.0
    }

}

extension AboutViewController: AboutViewProtocol {
    func updateView(personalInformation: PersonalInformation) {
        self.personalInformation = personalInformation
        DispatchQueue.main.async{
            self.tableView.reloadData()
            self.lblName.text = self.personalInformation?.name
            self.lblPosition.text = self.personalInformation?.position
            self.lblAbout.text = self.personalInformation?.about
        }
    }
    
    func getPersonalInformation() -> PersonalInformation? {
        return (self.tabBarController  as? TabBarController)?.resumeInformation?.cv?.personalInformation
    }
    
    
}

extension AboutViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutPresenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellsConstants.dataViewCellID, for: indexPath) as? DataViewCell else {
            return UITableViewCell()
        }
        
        let info = aboutPresenter.getInfoForRow(index: indexPath.row)
        cell.lblTitle.text = info?.personalKey ?? GeneralConst.emptyStr
        cell.imgViewDescription.text = info?.personalVale ?? GeneralConst.emptyStr
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
