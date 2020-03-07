//
//  ProgressHUD.swift
//  Progress HUD
//
//  Created by Fahim Rahman on 7/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    
    static func showSimpleHUD(hudView: UIView) {
        
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: .dark)
            hud.vibrancyEnabled = true
            hud.textLabel.text = "Loading"
            hud.show(in: hudView)
            hud.dismiss(afterDelay: 2.5)
        }
    }
    
    

    static func showHUDWithTransform(hudView: UIView) {
        
        let hud = JGProgressHUD(style: .dark)
        hud.vibrancyEnabled = true
        hud.textLabel.text = "Loading"
        hud.layoutMargins = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 10.0, right: 0.0)
        
        hud.show(in: hudView)

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            UIView.animate(withDuration: 0.1) {
                hud.indicatorView = nil
                hud.textLabel.font = UIFont.systemFont(ofSize: 20.0)
                hud.textLabel.text = "Done"
                hud.position = .center
            }
        }
        
        hud.dismiss(afterDelay: 4.0)
    }
    
    
    
    static func showDownloadingHUD(hudView: UIView) {
        
        let hud = JGProgressHUD(style: .dark)
        hud.vibrancyEnabled = true
        if arc4random_uniform(2) == 0 {
            hud.indicatorView = JGProgressHUDPieIndicatorView()
        }
        else {
            hud.indicatorView = JGProgressHUDRingIndicatorView()
        }
        hud.detailTextLabel.text = "0% Complete"
        hud.textLabel.text = "Downloading"
        hud.show(in: hudView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
            incrementHUD(hud, progress: 0)
        }
    }
    
    static func incrementHUD(_ hud: JGProgressHUD, progress previousProgress: Int) {
        let progress = previousProgress + 1
        hud.progress = Float(progress)/100.0
        hud.detailTextLabel.text = "\(progress)% Complete"
        
        if progress == 100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                UIView.animate(withDuration: 0.1, animations: {
                    hud.textLabel.text = "Success"
                    hud.detailTextLabel.text = nil
                    hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                })
                
                hud.dismiss(afterDelay: 1.0)
            }
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(20)) {
                self.incrementHUD(hud, progress: progress)
            }
        }
    }
}
