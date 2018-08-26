//
//  CreateSighting.swift
//  AnchorageMooseTracker_iOS
//
//  Created by Samuel Grosenick on 7/29/18.
//  Copyright © 2018 Samuel Grosenick. All rights reserved.
//

import UIKit

class CreateSighting: UIViewController {
    
    @IBOutlet weak var createSightingTitle: UILabel!
    @IBOutlet weak var numberofMooseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var mooseCountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var locButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.background
        
        createSightingTitle.font = UIFont(name: Theme.mainFontName, size: 22)
        numberofMooseLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        descriptionLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        locationLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        
        locButton.backgroundColor = Theme.tint
        locButton.setTitleColor(UIColor.white, for: .normal)
        locButton.layer.cornerRadius = 10
        
        //setup Notification Center observer
        NotificationCenter.default.addObserver(forName: Notification.Name.mooseLocation, object: nil, queue: OperationQueue.main) { (notification) in
            let mapVC = notification.object as! MapViewController
            
            //hide set location button
            self.locButton.isHidden = true
            self.latitudeLabel.text = mapVC.latString
            self.latitudeLabel.isHidden = false
            
            self.longitudeLabel.text = mapVC.lonString
            self.longitudeLabel.isHidden = false
        }

    }
    
}
