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

/**
 Class to handle the functionality for recording audio
 Used within all Recordings views
 */
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
    
    // Start recording and receive any name for the file the user has entered
    func startRecording(usersFileName: String) {
        // Create recording session
        let recordSession = AVAudioSession.sharedInstance()
        
        // Type of recording session
        do {
            try recordSession.setCategory(.playAndRecord, mode: .default)
            try recordSession.setActive(true)
        } catch {
            print("Failed to create recording session")
        }
        
        // Set where the file should be saved and the name of the file from user or just the date
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let recordingFileName =  url.appendingPathComponent("\(usersFileName)_\(Date().getFormattedDate(dateFormat: "dd-MM-YY_HH:mm")).m4a")
        
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
    
    // Function stops the recording and updates the RecordingsView
    func stopRecording(){
        recordAudio.stop()
        isRecording = false
        getRecordings()
    }
    
    // Function to get the stored recordings
    func getRecordings(){
        // Remove the old recordings
        recordings.removeAll()
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
        
        // Add each audio file in the contents of the app storage specified and add both the location and the date to the list of recordings to be displayed
        for audio in directoryContents{
            recordings.append(Recording(fileURL: audio, dateCreated: getDateCreated(for: audio)))
        }
        
        // Sort recordings and update the view
        recordings.sort(by: { $0.dateCreated.compare($1.dateCreated) == .orderedDescending})
        objectWillChange.send(self)
        
    }
    
    // Function to delete audios
    func deleteAudios(urlsBeingDeleted: [URL]){
        for url in urlsBeingDeleted {
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                print("This file couldnt be deleted")
            }
        }
        getRecordings()
    }
    
}

/**
 FUNCTIONS
 */
// Used to format the date for the recorded files name
extension Date {
    func getFormattedDate(dateFormat format : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

// Function takes a file paths and returns the date it was created
func getDateCreated(for file:URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let dateCreated = attributes[FileAttributeKey.creationDate] as? Date {
        return dateCreated
    } else { // If this fails just return todays date
        return Date()
    }
}
