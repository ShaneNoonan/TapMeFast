//
//  ViewController.swift
//  TapMeFast
//
//  Created by Shane Noonan on 29/12/2016.
//  Copyright © 2016 Shane Noonan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var tapMe: UIButton!
    @IBOutlet var startGame: UIButton!
    
    var timer = Timer()
    
    var tapInt = 0
    var timerInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerInt = 10
        tapInt = 0
        
        scoreLabel.text = String(tapInt)
        timerLabel.text = String(timerInt)
        
        tapMe.isEnabled = false
        tapMe.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMeButton(_ sender: Any) {
        
        tapInt += 1
        scoreLabel.text = String(tapInt)
    }

    @IBAction func startGameButton(_ sender: Any) {
        if timerInt == 10 {
            tapInt = 0
            scoreLabel.text = String(tapInt)
            
            tapMe.isEnabled = true
            tapMe.alpha = 1
            
            startGame.isEnabled = false
            startGame.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCounter), userInfo: nil, repeats: true)
        }
        
        if timerInt == 0 {
            
            timerInt = 10
            tapInt = 0
            
            scoreLabel.text = String(tapInt)
            timerLabel.text = String(timerInt)
            
            startGame.setTitle("START", for: [])
        }
    }
    
    func startCounter() {
        
        timerInt -= 1
        timerLabel.text = String(timerInt)
        
        if timerInt == 0 {
            timer.invalidate()
            
            tapMe.isEnabled = false
            tapMe.alpha = 0.5
            
            startGame.isEnabled = true
            startGame.alpha = 1
            startGame.setTitle("RESTART", for: [])
        }
    }
}

