//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Alexis on 28/06/2017.
//  Copyright © 2017 Alexis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecoringButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated: Bool)
        print("viewWillAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecoringButton: UIButton!
    
    
    @IBAction func recordAudio(_ sender: Any) {
        print("record was pressed")
        stopRecoringButton.isEnabled = true
        recordButton.isEnabled = false
    }

    @IBAction func stopRecording(_ sender: Any) {
        RecordingLabel.text = "Tap to record"
        recordButton.isEnabled = true
        stopRecoringButton.isEnabled = false
    }
}

