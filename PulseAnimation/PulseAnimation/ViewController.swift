//
//  ViewController.swift
//  PulseAnimation
//
//  Created by Zachary Hardin on 4/7/18.
//  Copyright © 2018 Zachary Hardin. All rights reserved.
//

import UIKit
import Pulsator

class ViewController: UIViewController {
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var togglePulseButton: UIButton!
    
    let pulsator = Pulsator()
    var buttonSelected = false
    
    @IBAction func togglePulse(_ sender: Any) {
        if buttonSelected {
            setButtonTitle("LOCATE DEVICE")
            
            pulsator.numPulse = 1
            heartImageView.layer.removeAllAnimations()
            
            pulsator.stop()
        } else {
            setButtonTitle("SEARCHING...")
            
            setUpPulser()
            heartImageView.layer.transform = CATransform3DIdentity
            animateHeart()
            
            pulsator.start()
        }
        
        buttonSelected = !buttonSelected
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heartImageView.layer.superlayer?.insertSublayer(pulsator, below: heartImageView.layer)
        
        setUpButton()
        setUpPulser()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setPulserPosition()
    }
    
    func setUpButton() {
        togglePulseButton.setTitle("LOCATE DEVICE", for: .normal)
        togglePulseButton.layer.cornerRadius = 10
        togglePulseButton.clipsToBounds = true
    }
    
    func setUpPulser() {
        pulsator.backgroundColor = UIColor.red.cgColor
        pulsator.radius = CGFloat(500)
        pulsator.speed = 0.5
        pulsator.numPulse = 8
    }
    
    func setPulserPosition() {
        pulsator.position = heartImageView.layer.position
    }
    
    func setButtonTitle(_ text: String) {
        togglePulseButton.setTitle(text, for: .normal)
    }
    
    func animateHeart() {
        UIView.animate(withDuration: 0.3, delay: 0.3, options: [.repeat, .autoreverse], animations: {
            self.heartImageView.transform = CGAffineTransform(scaleX: 1.04, y: 1.04)
        })
    }
}
