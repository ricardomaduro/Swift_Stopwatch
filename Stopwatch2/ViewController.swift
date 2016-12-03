//
//  ViewController.swift
//  Stopwatch2
//
//  Created by Ricardo Maduro on 07/10/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonPlay(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerTick"), userInfo: nil, repeats: true)
        labelStatus.text="Running"
        buttonPlayOutlet.enabled = false
        buttonPauseOutlet.enabled = true
        buttonStopOutlet.enabled = true

    }
    
    
    @IBAction func buttonPause(sender: AnyObject) {
        timer.invalidate()
        labelStatus.text="Paused"
        buttonPlayOutlet.enabled = true
        buttonPauseOutlet.enabled = false
    }
    
    
    @IBAction func buttonStopTop(sender: AnyObject) {
        timer.invalidate()
        seconds=0
        labelSeconds.text="00"
        labelMin.text="00"
        labelHours.text="00"
        labelStatus.text="Stopped"
        buttonPlayOutlet.enabled=true
        buttonPauseOutlet.enabled=false
    }
    
    @IBOutlet weak var labelSeconds: UILabel!
    @IBOutlet weak var labelMin: UILabel!
    @IBOutlet weak var labelHours: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    
    @IBOutlet weak var buttonPauseOutlet: UIBarButtonItem!
    @IBOutlet weak var buttonPlayOutlet: UIBarButtonItem!
    @IBOutlet weak var buttonStopOutlet: UIBarButtonItem!
    
    var timer = NSTimer()
    var minutes = 0
    var seconds = 0
    var hours = 0
    
    func timerTick() {
        
        seconds++
        if seconds < 10 {
            labelSeconds.text = "0\(seconds)"
        }
        else {
            labelSeconds.text = "\(seconds)"
        }
        
        if seconds > 59 {
            seconds = 0
            minutes++
            labelSeconds.text = "00"
            if minutes < 10 {
                labelMin.text = "0\(minutes)"
            }
            else {
                labelMin.text = "\(minutes)"
            }
        }
        
        if minutes > 59 {
            minutes = 0
            hours++
            labelMin.text = "00"
            if hours < 10 {
                labelHours.text = "0\(hours)"
            }
            else {
                labelHours.text = "\(hours)"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonPauseOutlet.enabled = false
        buttonStopOutlet.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

