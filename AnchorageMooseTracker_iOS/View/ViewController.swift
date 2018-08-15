//
//  ViewController.swift
//  AnchorageMooseTracker_iOS
//
//  Created by Samuel Grosenick on 7/17/18.
//  Copyright © 2018 Samuel Grosenick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var createSightingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSightingButton.backgroundColor = Theme.tint
        createSightingButton.setTitleColor(UIColor.white , for: .normal)
        createSightingButton.layer.cornerRadius = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
