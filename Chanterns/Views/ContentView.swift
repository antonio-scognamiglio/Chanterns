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
                    
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex]
)
                        .position(x: geo.frame(in: .global).minX + 150, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnA.index )
                    // change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition, perform: {_ in
                            let time = gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime
                            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                                withAnimation {
                                    if gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.count  - 1 > gameViewModel.chineseLanternColumns.columnA.index  {
                                        gameViewModel.chineseLanternColumns.columnA.index += 1
                                        gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).maxY
                                    }
                                }
                            })
                        })

                        .onTapGesture {
                            withAnimation {
                                gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].isTapped = true
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY
                }
        }
            .onChange(of: gameViewModel.chineseLanternColumns.columnA.index) { newValue in
                gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
