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
    
    var columnIndex: (CurrentColumn) -> Int {
        {
            column in
            switch column {
            case .columnA:
                return gameViewModel.chineseLanternColumns.columnA.index
            case .columnB:
                return gameViewModel.chineseLanternColumns.columnB.index
            case .columnC:
                return gameViewModel.chineseLanternColumns.columnC.index
            case .columnD:
                return gameViewModel.chineseLanternColumns.columnD.index
            }
        }
    }
    
    var canCreateLanterns: (CurrentColumn) -> Bool {
        {
            column in
            switch column {
            case .columnA:
                return gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnA)
            case .columnB:
                return gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnB)
            case .columnC:
                return gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnC)
            case .columnD:
                return gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnD)
            }
        }
        
    }

    
//    var columnIndices: [Int] {
//        [
//            gameViewModel.chineseLanternColumns.columnA.index,
//            gameViewModel.chineseLanternColumns.columnB.index,
//            gameViewModel.chineseLanternColumns.columnC.index,
//            gameViewModel.chineseLanternColumns.columnD.index
//        ]
//    }
//
//    var canCreateColumns: [Bool] {
//        // Is not elegant... But it works
//        [
//            gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnA),
//            gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnB),
//            gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnC),
//            gameViewModel.canCreateLantern(column: gameViewModel.chineseLanternColumns.columnD)
//
//        ]
//    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("NightSkyDark")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                // First Column
                if canCreateLanterns(.columnA) {
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnIndex(.columnA)]
                    )
                        .position(x: geo.frame(in: .global).minX + 120, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnIndex(.columnA)].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnA.index )
                    // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumnA(geo: geo)
                        })
                    // Reset Position after index has changed
                    .onChange(of: gameViewModel.chineseLanternColumns.columnA.index) { newValue in
                        gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
                    }
                    // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnA, geo: geo)                       }
                }
                // Second Column
                if canCreateLanterns(.columnB) {
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnB.chineseLanternsChunk[columnIndex(.columnB)]
                    )
                        .position(x: geo.frame(in: .global).midX - 120, y: gameViewModel.chineseLanternColumns.columnB.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnB.chineseLanternsChunk[columnIndex(.columnB)].animationTime), value: gameViewModel.chineseLanternColumns.columnB.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnB.index )
                    // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnB.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumnB(geo: geo)
                        })
                    // Reset Position after index has changed
                    .onChange(of: gameViewModel.chineseLanternColumns.columnB.index) { newValue in
                        gameViewModel.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).minY - 200
                    }
                    // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnB, geo: geo)                       }
                }
                // Third Column
                if canCreateLanterns(.columnC) {
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnC.chineseLanternsChunk[columnIndex(.columnC)]
                    )
                        .position(x: geo.frame(in: .global).midX + 120, y: gameViewModel.chineseLanternColumns.columnC.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnC.chineseLanternsChunk[columnIndex(.columnC)].animationTime), value: gameViewModel.chineseLanternColumns.columnC.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnC.index)
                    // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnC.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumnC(geo: geo)
                        })
                    // Reset Position after index has changed
                    .onChange(of: gameViewModel.chineseLanternColumns.columnC.index) { newValue in
                        gameViewModel.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).minY - 200
                    }
                    // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnC, geo: geo)                       }
                }
                // Fourth Column
                if canCreateLanterns(.columnD) {
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnD.chineseLanternsChunk[columnIndex(.columnD)]
                    )
                        .position(x: geo.frame(in: .global).maxX - 120, y: gameViewModel.chineseLanternColumns.columnD.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnD.chineseLanternsChunk[columnIndex(.columnD)].animationTime), value: gameViewModel.chineseLanternColumns.columnD.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnD.index)
                    // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnD.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumnD(geo: geo)
                        })
                    // Reset Position after index has changed
                    .onChange(of: gameViewModel.chineseLanternColumns.columnD.index) { newValue in
                        gameViewModel.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).minY - 200
                    }
                    // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnD, geo: geo)                       }
                }

            }
            // Start the game
            .onAppear {
                gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
                    gameViewModel.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).minY - 200
                    gameViewModel.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).minY - 200
                    gameViewModel.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).minY - 200
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
