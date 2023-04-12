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
                if !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.isEmpty && !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].isAnimationEnd {
                    
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index]
)
                        .position(x: geo.frame(in: .global).minX + 150, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnA.index )
//                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition){ newPosition in
//                            if newPosition == geo.frame(in: .global).minY  {
//
//                                DispatchQueue.main.asyncAfter(deadline: .now() + gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime){
//                                    withAnimation {
//                                        gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].isAnimationEnd = true
//                                    }
//                                }
//                            }
//                                // make the lantern disappear if reached the topScreen
//
//                                // change the index of the lantern
//
//                                // reset the position
//
//
//
//                        }
                        .onTapGesture {
                            withAnimation {
//                                gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].isTapped = true
                                if gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.count  - 1 > gameViewModel.chineseLanternColumns.columnA.index {
                                    gameViewModel.chineseLanternColumns.columnA.index += 1
                                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).maxY
                                }
                            }
                        }
                }
            }
            .onAppear {
                gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY)
                // non va bene sull'on Appear perché questa operazione va fatta sempre, ogni volta che cambia l'indice
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY
                }
        }
            .onChange(of: gameViewModel.chineseLanternColumns.columnA.index) { newValue in
                gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY
            }
            // questo dovrebbe funzionare per resettare la posizione, ma non funziona bene
            .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition) { newValue in
                if gameViewModel.chineseLanternColumns.columnA.yPosition == geo.frame(in: .global).maxY {
                    DispatchQueue.main.asyncAfter(deadline: .now() + gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime){
                        gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].isAnimationEnd = true
                }
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
