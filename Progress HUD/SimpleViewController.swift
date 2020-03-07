//
//  SimpleViewController.swift
//  Progress HUD
//
//  Created by Fahim Rahman on 7/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {
    
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var nextVCbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButton.layer.cornerRadius = 30
        nextVCbutton.layer.cornerRadius = 20
        self.title = "Simple Loading HUD"
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        
        UIViewController.showSimpleHUD(hudView: self.view)
    }
    
    @IBAction func nextVcButton(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "simpleWithTransformViewController") as! SimpleWithTransformViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
