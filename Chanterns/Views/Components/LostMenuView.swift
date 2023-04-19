//
//  LostMenuView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 18/04/23.
//

import SwiftUI

struct LostMenuView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    @ObservedObject var currentLevel: Level
    @Binding var tapToStart: Bool
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.popOverGradient)
                        .shadow(radius: 5)
                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.39)
                        .overlay {
                            VStack(spacing: 50) {
                                Button {
                                    withAnimation {
                                        // try again action
                                
                                        gameViewModel.resetLevel(level: currentLevel)
//                                        print("******* Cheng Yu dopo il reset")
//                                        print(currentLevel.chengYu)
                                        tapToStart = false
                                    }
//                                    currentLevel.chengYu.arrayCharacters.forEach { character in
//                                        gameViewModel.leftToBeGuessed.append(character.hanzi)
//                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.whiteShade)
                                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.08)
                                        .overlay {
                                            Text("Try Again")
                                                .foregroundColor(.black)
                                                .font(.system(size: 44))
                                        }
                                }
                                Button {
                                    // pop to root action
                        
                                    gameViewModel.resetLevel(level: currentLevel)
                                    dismiss()
//                                    currentLevel.chengYu.arrayCharacters.forEach { character in
//                                        gameViewModel.leftToBeGuessed.append(character.hanzi)
//                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.whiteShade)
                                        .frame(width: geo.size.width * 0.37, height: geo.size.height * 0.08)
                                        .overlay {
                                            Text("Main Menu")
                                                .foregroundColor(.black)
                                                .font(.system(size: 44))
                                        }
                                }

                            }
                        }
            }

            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}


struct LostMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LostMenuView(currentLevel: OriginalLevels.defaultLevels[0], tapToStart: .constant(false))
    }
}
