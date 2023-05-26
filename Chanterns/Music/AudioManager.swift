//
//  File.swift
//  
//
//  Created by Antonio Scognamiglio on 19/04/23.
//


import Foundation
import AVFoundation

class AudioManager: ObservableObject {
    @Published var gameMusicPlayer: AVAudioPlayer?
    @Published var effectsPlayer: AVAudioPlayer?
    
    
    func gameMusic() {
        let audioURL = Bundle.main.url(forResource: "Background", withExtension: ".mp3")
        
        guard audioURL != nil else {
            print("No audio found")
            return
        }
        do {
            self.gameMusicPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
            self.gameMusicPlayer?.play()
            self.gameMusicPlayer?.volume = 0.2
            self.gameMusicPlayer?.numberOfLoops = -1
            
        } catch {
            print("Error (\(error.localizedDescription)")
        }
        
    }
    
    func levelWinSound() {
        let audioURL = Bundle.main.url(forResource: "WinSound", withExtension: ".mp3")
        
        guard audioURL != nil else {
            print("No audio found")
            return
        }
        do {
            self.effectsPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
            self.effectsPlayer?.play()
            
        } catch {
            print("Error (\(error.localizedDescription)")
        }
    }
    
    func tapEffect() {
        let audioURL = Bundle.main.url(forResource: "Pop", withExtension: ".wav")
        
        guard audioURL != nil else {
            print("No audio found")
            return
        }
        do {
            self.effectsPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
            self.effectsPlayer?.play()
            
        } catch {
            print("Error (\(error.localizedDescription)")
        }
        
    }
    
    func buttonSound() {
        let audioURL = Bundle.main.url(forResource: "ButtonSound", withExtension: ".wav")
        
        guard audioURL != nil else {
            print("No audio found")
            return
        }
        do {
            self.effectsPlayer =  try AVAudioPlayer(contentsOf: audioURL!)
            self.effectsPlayer?.play()
            
        } catch {
            print("Error (\(error.localizedDescription)")
        }
        
    }
}
