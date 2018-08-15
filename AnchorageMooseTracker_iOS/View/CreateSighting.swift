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

    }
    
}
