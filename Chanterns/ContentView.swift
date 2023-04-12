//
//  ContentView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameViewModel = GameViewModel()
    var arrayCharacters = ["你","好","老","神"]
    var columnAIndex: Int {
        gameViewModel.chineseLanternColumns.columnA.index
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("NightSkyDark")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
//                ForEach(gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk){ lantern in
//                            ChineseLanternView(chineseLantern: lantern)
//                        .position(x: geo.frame(in: .global).minX + 150, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
//                        .animation(.easeIn(duration: lantern.animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
//                    }
                if !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.isEmpty {
                    
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex])
                        .position(x: geo.frame(in: .global).minX + 150, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition){ newPosition in
                            if newPosition == geo.frame(in: .global).minY  {
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime){
                                    withAnimation {
                                        gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].isAnimationEnd = true
                                    }
                                }
                                
                                // make the lantern disappear if reached the topScreen
                                                            
                                // change the index of the lantern
                             
                                // reset the position
                               
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].isTapped = true
                            }
                        }
                }
            }
            .onAppear {
                gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY
                }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
