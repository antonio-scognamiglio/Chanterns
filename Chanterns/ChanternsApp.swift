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
    var body: some Scene {
        WindowGroup {
            ChengYuListView()
                .environmentObject(gameViewModel)
//                .preferredColorScheme(.dark)
        }
    }
}
