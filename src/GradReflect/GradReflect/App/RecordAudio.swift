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

class RecordAudio: NSObject, ObservableObject {
    
    // Fetch recordings when the app is opened and RecordAudio is ran
    override init() {
        super.init()
        getRecordings()
    }
    
    // Notifies observing views when recording is started etc
    let objectWillChange = PassthroughSubject<RecordAudio, Never>()
    var recordAudio: AVAudioRecorder!
    
    var recordings = [Recording]()
    
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
        // change this to getName()
        let recordingFileName =  docPath.appendingPathComponent("hello\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm")).m4a")
        
        // Create the settings that the recording will be made at
        let recordingSettings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        // Start the recording, let the RecordingsView know that app is currently recording
        do {
            recordAudio = try AVAudioRecorder(url: recordingFileName, settings: recordingSettings)
            recordAudio.record()
            isRecording = true
        } catch {
            print ("recording isnt working")
        }
        
    } // end of start recording function
    
    func getName(){
        // Check input
        return
    }
    
    // Function stops the recording and updates the RecordingsView
    func stopRecording(){
        recordAudio.stop()
        isRecording = false
        
        // MAYBE FIND A WAY TO RENAME FILE ????
        // or create a display name and not mess with the date and time system of the doc path
        
        getRecordings()
        
    }
    
    
    // Function to get the stored recordings
    func getRecordings(){
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let docDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: docDirectory, includingPropertiesForKeys: nil)
        
        // Add each audio file in the contents of the app storage specified and add both the location and the date to the list of recordings to be displayed
        for audio in directoryContents{
            let recording = Recording(fileURL: audio, dateCreated: getDateCreated(for: audio))
            recordings.append(recording)
        }
        
        // Sort recordings and update the view
        recordings.sort(by: { $0.dateCreated.compare($1.dateCreated) == .orderedDescending})
        objectWillChange.send(self)
        
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

