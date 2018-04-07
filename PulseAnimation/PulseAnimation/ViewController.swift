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
            setButtonTitle("START")
            
            pulsator.numPulse = 0
            pulsator.speed = 0.007
            pulsator.stop()
        } else {
            setButtonTitle("STOP")
            pulsator.start()
            
            setPulserSpeed()
            setPulserNumber()
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
    
    fileprivate func setUpButton() {
        togglePulseButton.setTitle("START", for: .normal)
        togglePulseButton.layer.cornerRadius = 10
        togglePulseButton.clipsToBounds = true
    }
    
    fileprivate func setUpPulser() {
        setPulserColor()
        setPulserRadius()
        setPulserSpeed()
        setPulserNumber()
    }
    
    fileprivate func setPulserNumber() {
        pulsator.numPulse = 8
    }
    
    fileprivate func setPulserSpeed() {
        pulsator.speed = 0.5
    }
    
    fileprivate func setPulserPosition() {
        pulsator.position = heartImageView.layer.position
    }
    
    fileprivate func setPulserColor() {
        pulsator.backgroundColor = UIColor(
            red: CGFloat(255),
            green: CGFloat(0),
            blue: CGFloat(0),
            alpha: CGFloat(1)
            ).cgColor
    }
    
    fileprivate func setPulserRadius() {
        pulsator.radius = CGFloat(500)
    }
    
    fileprivate func setButtonTitle(_ text: String) {
        togglePulseButton.setTitle(text, for: .normal)
    }
}
