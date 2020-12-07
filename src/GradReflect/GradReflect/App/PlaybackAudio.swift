//
//  PlaybackAudio.swift
//  GradReflect
//
//  Created by Gemma McDonald on 07/12/2020.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class PlaybackAudio: NSObject, ObservableObject, AVAudioPlayerDelegate {
    let objectWillChange = PassthroughSubject<PlaybackAudio, Never>()
    
    // Inform views that there is an audio playing back
    var isPlayingBack = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var playbackAudio: AVAudioPlayer!
    
    // Function to play the audio from the filepath sent to it
    func startAudioPlayback (audio: URL){
        let audioPlaySession = AVAudioSession.sharedInstance()
        
        // Get it to play through the phones speakers rather than the earpiece
        do {
            try audioPlaySession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
                print("Can't play over the speakers")
        }
        
        do {
            playbackAudio = try AVAudioPlayer(contentsOf: audio)
            playbackAudio.delegate = self
            playbackAudio.play()
            isPlayingBack = true
        } catch {
            print("Cant do playback")
        }
        
        
    }
    
    func stopAudioPlayback() {
        playbackAudio.stop()
        isPlayingBack = false
    }
    
    // Function is part of AVAudioPlayerDelegate, checks for when an audio is finished and updates the view
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag:Bool){
        if flag{
            isPlayingBack = false
        }
    }
    
}
