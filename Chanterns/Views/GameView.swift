//
//  GameView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 06/04/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    @State var tapToStart = false
    @StateObject var level: Level
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Image("NightSkyDarkPortraitBigStars")
                    .resizable()
                    .blur(radius: gameViewModel.isAnimationPaused ? 5 : 0)
                .edgesIgnoringSafeArea(.all)
                
                   
                // ChengYu Scroll
                VStack {
                    if tapToStart {
                        ChengYuView(chengYu: level.chengYu, showPinyin: false)
                            .frame(width: geo.size.width * 0.55, height: geo.size.height * 0.2)
                            .opacity(level.timeLeft  > 0 && !gameViewModel.isAnimationPaused  ? 1 : 0)
                            .animation(Animation.default, value: level.timeLeft)

                    } else if !tapToStart && level.timeLeft > 0 {
                        Image("ScrollClose")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.55, height: geo.size.height * 0.2)
                    }
//                    else {
//                        ChengYuView(chengYu: ChengYu.example, showPinyin: false)
//                            .frame(width: geo.size.width * 0.55, height: geo.size.height * 0.2)
//                            .opacity(0)
//                    }
                    
                Text("")
                        .frame(height: geo.size.height * 0.3)
                    Text("Tap on the screen to start!")
                        .foregroundColor(.yellowStar)
                        .font(.system(size: 48))
                        .opacity(!tapToStart ? 1 : 0)
                        .animation(Animation.default, value: tapToStart)
                    
                }
                
               // Columns
                Group {
                    // First Column
                    if canCreateLanterns(.columnA) {
                        ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnIndex(.columnA)]
                        )
                        .opacity(gameViewModel.isAnimationPaused ? 0 : 1)
                        .position(x: geo.frame(in: .global).minX + 120, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        // Quando cambia la posizione animi il cambiamento
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnIndex(.columnA)].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        
                        .id(gameViewModel.chineseLanternColumns.columnA.index)
                        
                        // Change the index after moving has finished
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition, perform: {_ in
                            
                            gameViewModel.nextLanterAfterMovingColumn(column: .columnA, geo: geo)
                        })
                        // Doppio controllo, guardo anche se l'animazione è in pausa
                        .onChange(of: gameViewModel.isAnimationPaused, perform: {_ in

                            gameViewModel.nextLanterAfterMovingColumn(column: .columnA, geo: geo)
                        })
                        
                        // Reset Position after index has changed e questo lo devo fare anche quando metto pausa
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.index) { newValue in
                            gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
                        }

                        // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.checkTap(column: gameViewModel.chineseLanternColumns.columnA, level: level)
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnA, geo: geo)                       }
                    }
                    
                    // Commento un attimo
                    // Second Column
                    if canCreateLanterns(.columnB) {
                        ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnB.chineseLanternsChunk[columnIndex(.columnB)]
                        )
                        .opacity(gameViewModel.isAnimationPaused ? 0 : 1)
                        .position(x: geo.frame(in: .global).midX - 120, y: gameViewModel.chineseLanternColumns.columnB.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnB.chineseLanternsChunk[columnIndex(.columnB)].animationTime), value: gameViewModel.chineseLanternColumns.columnB.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnB.index )
                        // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnB.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumn(column: .columnB, geo: geo)
                        })
                        // Doppio controllo, guardo anche se l'animazione è in pausa
                        .onChange(of: gameViewModel.isAnimationPaused, perform: {_ in

                            gameViewModel.nextLanterAfterMovingColumn(column: .columnB, geo: geo)
                        })
                        // Reset Position after index has changed
                        .onChange(of: gameViewModel.chineseLanternColumns.columnB.index) { newValue in
                            gameViewModel.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).minY - 200
                        }
                        // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.checkTap(column: gameViewModel.chineseLanternColumns.columnB, level: level)
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnB, geo: geo)                       }
                    }
                    
                    // Third Column
                    if canCreateLanterns(.columnC) {
                        ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnC.chineseLanternsChunk[columnIndex(.columnC)]
                        )
                        .opacity(gameViewModel.isAnimationPaused ? 0 : 1)
                        .position(x: geo.frame(in: .global).midX + 120, y: gameViewModel.chineseLanternColumns.columnC.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnC.chineseLanternsChunk[columnIndex(.columnC)].animationTime), value: gameViewModel.chineseLanternColumns.columnC.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnC.index)
                        // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnC.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumn(column: .columnC, geo: geo)
                        })
                        // Doppio controllo, guardo anche se l'animazione è in pausa
                        .onChange(of: gameViewModel.isAnimationPaused, perform: {_ in

                            gameViewModel.nextLanterAfterMovingColumn(column: .columnC, geo: geo)
                        })
                        // Reset Position after index has changed
                        .onChange(of: gameViewModel.chineseLanternColumns.columnC.index) { newValue in
                            gameViewModel.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).minY - 200
                        }
                        // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.checkTap(column: gameViewModel.chineseLanternColumns.columnC, level: level)
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnC, geo: geo)                       }
                    }
                    
                    // Fourth Column
                    if canCreateLanterns(.columnD) {
                        ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnD.chineseLanternsChunk[columnIndex(.columnD)]
                        )
                        .opacity(gameViewModel.isAnimationPaused ? 0 : 1)
                        .position(x: geo.frame(in: .global).maxX - 120, y: gameViewModel.chineseLanternColumns.columnD.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnD.chineseLanternsChunk[columnIndex(.columnD)].animationTime), value: gameViewModel.chineseLanternColumns.columnD.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnD.index)
                        // Change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnD.yPosition, perform: {_ in
                            gameViewModel.nextLanterAfterMovingColumn(column: .columnD, geo: geo)
                        })
                        // Doppio controllo, guardo anche se l'animazione è in pausa
                        .onChange(of: gameViewModel.isAnimationPaused, perform: {_ in

                            gameViewModel.nextLanterAfterMovingColumn(column: .columnD, geo: geo)
                        })
                        // Reset Position after index has changed
                        .onChange(of: gameViewModel.chineseLanternColumns.columnD.index) { newValue in
                            gameViewModel.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).minY - 200
                        }
                        // change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.checkTap(column: gameViewModel.chineseLanternColumns.columnD, level: level)
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnD, geo: geo)                       }
                    }
                }
                
                if gameViewModel.isAnimationPaused {
                        PauseView(gameViewModel: gameViewModel)
                        .transition(.asymmetric(insertion: .scale, removal: .identity))
                }
                
                // Non si aggiorna la view
                TopBarView(level: level)
//                    .environmentObject(gameViewModel)
                    .onReceive(timer) { _ in
                        if level.timeLeft > 0 && tapToStart && !gameViewModel.isAnimationPaused {
                            level.timeLeft -= 1
                        }
                    }
                }
            .navigationBarBackButtonHidden()
           
            // Inizializzo le distanze
            .onAppear {
                // non so se le sto usando ancora le distanze
                gameViewModel.yStartPosition = geo.frame(in: .global).maxY
                gameViewModel.YEndPosition = geo.frame(in: .global).minY - 200
                
                level.chengYu.arrayCharacters.forEach { character in
                    gameViewModel.leftToBeGuessed.append(character.hanzi)
                }
            }
            // To start the game
            .onTapGesture {
                withAnimation {
                tapToStart = true
                }
            }
            // DECOMMENTARE
            .onChange(of: level.timeLeft) { _ in
                if level.timeLeft == 0 {
                    gameViewModel.isGameStarted = true
                    gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY, level: level.levelNumber)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
                            
                            gameViewModel.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).minY - 200
                            
                            gameViewModel.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).minY - 200
                            
                            gameViewModel.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).minY - 200
                        }
                }
            }
            
//            .onChange(of: gameViewModel.isAnimationPaused) { newValue in
//                if newValue == false {
//                    gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY)
//                        DispatchQueue.main.asyncAfter(deadline: .now()) {
//                            gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
//                            
//                            gameViewModel.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).minY - 200
//                            
//                            gameViewModel.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).minY - 200
//                            
//                            gameViewModel.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).minY - 200
//                        }
//                }
//            }
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: Level.originalLevels[0])
            .environmentObject(GameViewModel())
    }
}
