//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Alexis on 28/06/2017.
//  Copyright © 2017 Alexis. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var RecordingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecoringButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecoringButton: UIButton!


    @IBAction func recordAudio(_ sender: Any) {
        configureUI(true)

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(_ sender: Any) {
        configureUI(false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    //function to enable and disable the recordButton and stopRecordingButton
    func configureUI(_ isRecording: Bool) {
        recordButton.isEnabled = !isRecording
        stopRecoringButton.isEnabled = isRecording
        if isRecording {
            RecordingLabel.text = "Recording"
        } else {
            RecordingLabel.text = "Tap to record"
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
}
