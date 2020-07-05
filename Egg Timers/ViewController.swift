//
//  ViewController.swift
//  Egg Timers
//
//  Created by Adithep on 7/3/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    var aTime = 0
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard":540]
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showTimerLabel: UILabel!
    
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        showLabel.text = hardness
        totalTime = eggTimes[hardness]!
        aTime = eggTimes[hardness]!
        secondsPassed = 0
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateBar), userInfo: nil, repeats: true)
    }
    
    
    //MARK: - Progress Bar
    @objc func updateBar() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            if aTime > 0 {
                self.showTimerLabel.text = self.timeFormatted(self.aTime)
                aTime -= 1
            }
        } else {
            timer.invalidate()
            self.showTimerLabel.text = "DONE"
        }
    }
    
    //MARK: - Time
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

}

