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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("record was pressed")
        RecordingLabel.text = "Recording in progress"
    }

}

