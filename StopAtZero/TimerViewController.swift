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
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        updateResult()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        resetAll()
    }
    
    func resetAll() {
        counter = 0
        totolPlay = 0
        winGame = 0
        timerLabel.text = String(format: "%02d:%02d:%02d", 0, 0, 0)
        resultLabel.text = String(format: "Result: %02d/%02d", 0, 0)
    }
    
    func showTime() {
        let millisecond = counter<100 ? counter : counter%100
        let second = counter/100
        let minute = second/60
        timerLabel.text = String(format: "%02d:%02d:%02d", minute, second, millisecond)
    }
    
    func updateCounter() {
        counter++
        showTime()
    }
    
    func updateResult() {
        totolPlay++
        winGame = isWin() ? ++winGame : winGame
        resultLabel.text = String(format: "Result: %02d/%02d", winGame, totolPlay)
    }
    
    func isWin() -> Bool {
        return counter%10 == 0 ? true : false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

