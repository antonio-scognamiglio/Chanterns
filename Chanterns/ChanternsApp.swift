//
//  ChanternsApp.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 06/04/23.
//

import SwiftUI

@main
struct ChanternsApp: App {
    @StateObject var gameViewModel = GameViewModel()
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            GameMenuView()
                .statusBar(hidden: true)
                .preferredColorScheme(.light)
                .environmentObject(gameViewModel)
                .environmentObject(audioManager)
        }

    }
}
