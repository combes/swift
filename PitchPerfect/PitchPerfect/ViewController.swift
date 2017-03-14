//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Christopher Combes on 3/12/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in Progress"
        recordingLabel.sizeToFit()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("stop")
    }
}

