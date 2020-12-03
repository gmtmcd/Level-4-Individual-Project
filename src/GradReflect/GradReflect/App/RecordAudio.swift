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
    
}


