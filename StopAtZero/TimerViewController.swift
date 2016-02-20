//
//  ViewController.swift
//  StopAtZero
//
//  Created by Red_iMac on 2/19/16.
//  Copyright © 2016 RedPencil. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var timer = NSTimer()
    var counter = 0
    var totolPlay = 0
    var winGame = 0
    
    @IBAction func start(sender: AnyObject) {
        
        guard !timer.valid else { return }
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        totolPlay++
        winGame = counter%10 == 0 ? ++winGame : winGame
        resultLabel.text = String(format: "Result: %02d/%02d", winGame, totolPlay)
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        totolPlay = 0
        winGame = 0
        timerLabel.text = String(format: "%02d:%02d:%02d", 0, 0, 0)
        resultLabel.text = String(format: "Result: %02d/%02d", 0, 0)
    }
    
    func updateCounter() {
        counter++
        let millisecond = counter<100 ? counter : counter%100
        let second = counter/100
        let minute = second/60
        timerLabel.text = String(format: "%02d:%02d:%02d", minute, second, millisecond)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

