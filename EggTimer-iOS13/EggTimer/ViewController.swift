//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    //    let softTime = 5 * 60
    //    let mediumTime = 8 * 60
    //    let hardTime = 12 * 60
    
    
    
    let eggTimes = ["Soft": 5, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        
        secondsPassed = 0
        
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed  += 1
           progressBar.progress =  Float(secondsPassed) /  Float( totalTime)
        } else if progressBar.progress == 100 {
            func playSound() {
                guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
                
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)
                    
                    
                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    
                    
                    guard let player = player else { return }
                    
                    player.play()
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
        }
    }
    }


        








//        let hardness = sender.currentTitle!
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //        if hardness == "Soft" {
    //            print(softTime)
    //        } else if hardness == "Medium" {
    //            print(mediumTime)
    //        } else if hardness == "Hard" {
    //            print(hardTime)
    //        }
    //    }
    //}

