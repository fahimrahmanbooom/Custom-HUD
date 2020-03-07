//
//  DownloadHUDViewController.swift
//  Progress HUD
//
//  Created by Fahim Rahman on 8/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class DownloadHUDViewController: UIViewController {

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var nextVCbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButton.layer.cornerRadius = 30
        nextVCbutton.layer.cornerRadius = 20
        self.title = "Downloading HUD with Success"
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        
        UIViewController.showDownloadingHUD(hudView: self.view)
    }
    
    @IBAction func nextVcButton(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
