//
//  RecordAudio.swift
//  GradReflect
//
//  Created by Gemma McDonald on 03/12/2020.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class RecordAudio: ObservableObject {
    
    // Notifies observing views when recording is started etc
    let objectWillChange = PassthroughSubject<RecordAudio, Never>()
    var recordAudio: AVAudioRecorder!
    
    // Variable to hold whether something is being recorded, allows to update observing views
    var isRecording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        // Create recording session
        let recordSession = AVAudioSession.sharedInstance()
        
        // Type of recording session
        do {
            try recordSession.setCategory(.playAndRecord, mode: .default)
            try recordSession.setActive(true)
        } catch {
            print("Failed to create recording session")
        }
        
        // Set where the file should be saved and the name of the file
        let docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let recordingFileName = docPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm")).m4a")
        
        // Create the settings that the recording will be made at
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        // Start the recording, let the RecordingsView know that app is currently recording
        do {
            recordAudio = try AVAudioRecorder(url: recordingFileName, settings: settings)
            recordAudio.record()
            isRecording = true
        } catch {
            print ("recording isnt working")
        }
        
    } // end of start recording function
    
    // Function stops the recording and updates the RecordingsView
    func stopRecording(){
        recordAudio.stop()
        isRecording = false
    }
    
}

// Used to format the date for the recorded files name
extension Date {
    func toString(dateFormat format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

